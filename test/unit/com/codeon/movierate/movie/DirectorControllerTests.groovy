package com.codeon.movierate.movie



import org.junit.*
import grails.test.mixin.*

@TestFor(DirectorController)
@Mock(Director)
class DirectorControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/director/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.directorInstanceList.size() == 0
        assert model.directorInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.directorInstance != null
    }

    void testSave() {
        controller.save()

        assert model.directorInstance != null
        assert view == '/director/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/director/show/1'
        assert controller.flash.message != null
        assert Director.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/director/list'

        populateValidParams(params)
        def director = new Director(params)

        assert director.save() != null

        params.id = director.id

        def model = controller.show()

        assert model.directorInstance == director
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/director/list'

        populateValidParams(params)
        def director = new Director(params)

        assert director.save() != null

        params.id = director.id

        def model = controller.edit()

        assert model.directorInstance == director
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/director/list'

        response.reset()

        populateValidParams(params)
        def director = new Director(params)

        assert director.save() != null

        // test invalid parameters in update
        params.id = director.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/director/edit"
        assert model.directorInstance != null

        director.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/director/show/$director.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        director.clearErrors()

        populateValidParams(params)
        params.id = director.id
        params.version = -1
        controller.update()

        assert view == "/director/edit"
        assert model.directorInstance != null
        assert model.directorInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/director/list'

        response.reset()

        populateValidParams(params)
        def director = new Director(params)

        assert director.save() != null
        assert Director.count() == 1

        params.id = director.id

        controller.delete()

        assert Director.count() == 0
        assert Director.get(director.id) == null
        assert response.redirectedUrl == '/director/list'
    }
}

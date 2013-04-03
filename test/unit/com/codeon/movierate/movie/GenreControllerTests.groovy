package com.codeon.movierate.movie



import org.junit.*
import grails.test.mixin.*

@TestFor(GenreController)
@Mock(Genre)
class GenreControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/genre/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.genreInstanceList.size() == 0
        assert model.genreInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.genreInstance != null
    }

    void testSave() {
        controller.save()

        assert model.genreInstance != null
        assert view == '/genre/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/genre/show/1'
        assert controller.flash.message != null
        assert Genre.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/genre/list'

        populateValidParams(params)
        def genre = new Genre(params)

        assert genre.save() != null

        params.id = genre.id

        def model = controller.show()

        assert model.genreInstance == genre
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/genre/list'

        populateValidParams(params)
        def genre = new Genre(params)

        assert genre.save() != null

        params.id = genre.id

        def model = controller.edit()

        assert model.genreInstance == genre
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/genre/list'

        response.reset()

        populateValidParams(params)
        def genre = new Genre(params)

        assert genre.save() != null

        // test invalid parameters in update
        params.id = genre.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/genre/edit"
        assert model.genreInstance != null

        genre.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/genre/show/$genre.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        genre.clearErrors()

        populateValidParams(params)
        params.id = genre.id
        params.version = -1
        controller.update()

        assert view == "/genre/edit"
        assert model.genreInstance != null
        assert model.genreInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/genre/list'

        response.reset()

        populateValidParams(params)
        def genre = new Genre(params)

        assert genre.save() != null
        assert Genre.count() == 1

        params.id = genre.id

        controller.delete()

        assert Genre.count() == 0
        assert Genre.get(genre.id) == null
        assert response.redirectedUrl == '/genre/list'
    }
}

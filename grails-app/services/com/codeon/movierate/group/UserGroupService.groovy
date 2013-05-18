package com.codeon.movierate.group

import com.codeon.movierate.user.User

/**
 * Created with IntelliJ IDEA.
 * User: slanus
 * Date: 11/05/13
 * Time: 10:55
 * To change this template use File | Settings | File Templates.
 */
class UserGroupService {
/*
    def complist(params){
        def query = {
            or {
                like("owner.username", "${params.term}%") // term is the parameter send by jQuery autocomplete
            }
            projections { // good to select only the required columns.
                property("id")
                property("username")
            }
        }
        def clist = User.createCriteria().list(query) // execute  to the get the list of companies
        def companySelectList = [] // to add each company details
        clist.each {
            def companyMap = [:] // add to map. jQuery autocomplete expects the JSON object to be with id/label/value.
            companyMap.put("id", it[0])
            companyMap.put("label", it[2])
            companyMap.put("value", it[2])
            companyMap.put("nasSymbol", it[1]) // will use this to pre-populate the Emp Id
            companySelectList.add(companyMap) // add to the arraylist
        }
        return companySelectList
    }                                 */

}

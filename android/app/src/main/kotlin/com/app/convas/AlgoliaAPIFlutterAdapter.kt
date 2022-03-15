package com.app.convas
import android.util.Log
import com.algolia.search.client.ClientSearch
import com.algolia.search.helper.toAPIKey
import com.algolia.search.helper.toApplicationID
import com.algolia.search.helper.toIndexName
import com.algolia.search.model.IndexName
import com.algolia.search.model.response.ResponseSearch
import com.algolia.search.model.search.Query
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.runBlocking
import kotlinx.serialization.json.Json

class AlgoliaAPIFlutterAdapter(
    applicationID: String,
    apiKey: String,
) {

    private val client = ClientSearch(applicationID.toApplicationID(), apiKey.toAPIKey())

    fun perform(call: MethodCall, result: MethodChannel.Result): Unit = runBlocking {
        Log.d("AlgoliaAPIAdapter", "method: ${call.method}")
        Log.d("AlgoliaAPIAdapter", "args: ${call.arguments}")
        val args = call.arguments as? List<String>
        if (args == null) {
            result.error("AlgoliaNativeError", "Missing arguments", null)
            return@runBlocking
        }

        var searchConditionAllKeyword =  args[1]
        if(searchConditionAllKeyword==null){
            searchConditionAllKeyword=""
        }

        var searchConditionbirthDateMin =  args[2]

        var searchConditionbirthDateMax =  args[3]


        var searchConditionLevelList =  fromTextToList(args[4],"level")
        var searchConditionMotherTongueList =  fromTextToList(args[5],"motherTongue")
        var searchConditionCountryList =  fromTextToList(args[6],"country")
        var searchConditionGenderList =  fromTextToList(args[7],"gender")

        var searchConditionHomeCountryList =  fromTextToList(args[8],"homeCoutry")
        var searchConditionlastLogin=args[9];
//        var searchConditionCategoriesList =  fromTextToList(args[10],"gender")
//        var searchConditionCoursesList =  fromTextToList(args[11],"gender")
        var searchConditionUserTypeList =  fromTextToList(args[12],"userType")

        var userDocId =  args[13]



        val query = Query(query=searchConditionAllKeyword,
            facetFilters= listOf(
                searchConditionLevelList,
                searchConditionMotherTongueList,
                searchConditionCountryList,
                searchConditionGenderList,
                searchConditionUserTypeList,
                searchConditionHomeCountryList,
                listOf("objectID:-$userDocId")),
            numericFilters = listOf(listOf("birthDate<$searchConditionbirthDateMax"),
                listOf("birthDate>$searchConditionbirthDateMin"),
                listOf("lastLoginTime>$searchConditionlastLogin"),
            )
        )

        Log.d("AlgoliaAPIAdapter",query.toString())

        when (call.method) {
            METHOD_SEARCH -> search(indexName = args[0].toIndexName(), query=query, result = result)
            else -> result.notImplemented()
        }
    }

    suspend fun search(indexName: IndexName, query: Query, result: MethodChannel.Result) {
        val index = client.initIndex(indexName)
        try {
            val search = index.search(query = query)
            result.success(Json.encodeToString(ResponseSearch.serializer(), search))
        } catch (e: Exception) {
            result.error("AlgoliaNativeError", e.localizedMessage, e.cause)
        }
    }

    companion object {
        private const val METHOD_SEARCH = "selectUsersByConditionsOnKotlin"
    }
}

package com.app.convas

import android.util.Log
import com.algolia.search.client.ClientSearch
import com.algolia.search.dsl.*
import com.algolia.search.helper.toAPIKey
import com.algolia.search.helper.toApplicationID
import com.algolia.search.helper.toIndexName
import com.algolia.search.model.Attribute
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

        //引数
//        String? searchConditionAllKeyword,
//        required String birthDateMin in epochmillisedonds,
//        required String birthDateMax in epochmillisedonds,
//        String? searchConditionLevel,
//        String? searchConditionMotherTongue,
//        String? searchConditionCountry,
//        String? searchConditionGender,

        var searchConditionAllKeyword =  args[1]

        var searchConditionbirthDateMin =  args[2]
        Log.d("AlgoliaAPIAdapter", "KKKKKKKKKKKKKKKKKKKKKKKK"+searchConditionbirthDateMin)

        var searchConditionbirthDateMax =  args[3]
        Log.d("AlgoliaAPIAdapter", "KKKKKKKKKKKKKKKKKKKKKKKK"+searchConditionbirthDateMax)

        var searchConditionLevelArrayList =  fromTextToList(args[4])
        var searchConditionMotherTongueArrayList =  fromTextToList(args[5])
        var searchConditionCountryArrayList =  fromTextToList(args[6])
        var searchConditionGenderArrayList =  fromTextToList(args[7])
        var userDocId =  args[8]


        val query = query(searchConditionAllKeyword) {
            filters {
                and {
                    range(
                        "birthDate",
                        searchConditionbirthDateMin.toLong() until searchConditionbirthDateMax.toLong()
                    )
                }
            }
        }














//        val query = query{
//            filters {
//                and {
////                    range(
////                        "birthDate",searchConditionbirthDateMin.toLong() .. searchConditionbirthDateMax.toLong()
////                    )
////                    facet("motherTongue","JPN")
//                    facet("level","4")
//
//                }
//                and{
//                    range(
//                        "birthDate",searchConditionbirthDateMin.toLong() .. searchConditionbirthDateMax.toLong()
//                    )
////                    facet("level","4")
//                }
//
//            }
////            facetFilters{
////                and{
//////                    facet("level","4")
////                }
////
////            }
//        }

        Log.d("AlgoliaAPIAdapter", "aSSSSSSSSSSSSSSSSSSSS$query")

//        val query = query(
//            "motherTongue:JPN"
//
//        ) {
//
//            filters{
//                and{
//                    range("birthDate", searchConditionbirthDateMin.toLong() until searchConditionbirthDateMax.toLong())
//
//                }
//
//
//                orFacet{
//
//                }
//
//            }

//            filters {
//                and {
////                    facet("color", "red")
////                    facet("category", "shirt")
//                }
////                orNumeric {
////                    range("age", searchConditionAgeArrayList[0].toIntOrNull()!! until searchConditionAgeArrayList[1].toIntOrNull()!!)
////                    comparison("price", Equals, 15)
////                }
//            }
//        }
        when (call.method) {
            METHOD_SEARCH -> search(indexName = args[0].toIndexName(), query=query, result = result)
            else -> result.notImplemented()
        }
    }

    suspend fun search(indexName: IndexName, query: Query, result: MethodChannel.Result) {
        val index = client.initIndex(indexName)
        try {

//            val settings = settings {
//                attributesForFaceting {
//                    +"level" // or FilterOnly(brand) for filtering purposes only
//                }
//                searchableAttributes {
//                    +"level"
//                    +"address"
//                }
//            }
//            index.setSettings(settings)

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

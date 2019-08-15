# square
#
# This file was automatically generated by APIMATIC v2.0
# ( https://apimatic.io ).

module Square
  # CatalogApi
  class CatalogApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Deletes a set of [CatalogItem](#type-catalogitem)s based on the
    # provided list of target IDs and returns a set of successfully deleted IDs
    # in
    # the response. Deletion is a cascading event such that all children of the
    # targeted object are also deleted. For example, deleting a CatalogItem will
    # also delete all of its [CatalogItemVariation](#type-catalogitemvariation)
    # children.
    # `BatchDeleteCatalogObjects` succeeds even if only a portion of the
    # targeted
    # IDs can be deleted. The response will only include IDs that were
    # actually deleted.
    # @param [BatchDeleteCatalogObjectsRequest] body Required parameter: An
    # object containing the fields to POST for the request.  See the
    # corresponding object definition for field details.
    # @return [BatchDeleteCatalogObjectsResponse Hash] response from the API call
    def batch_delete_catalog_objects(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/catalog/batch-delete'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Returns a set of objects based on the provided ID.
    # Each [CatalogItem](#type-catalogitem) returned in the set includes all of
    # its
    # child information including: all of its
    # [CatalogItemVariation](#type-catalogitemvariation) objects, references to
    # its [CatalogModifierList](#type-catalogmodifierlist) objects, and the ids
    # of
    # any [CatalogTax](#type-catalogtax) objects that apply to it.
    # @param [BatchRetrieveCatalogObjectsRequest] body Required parameter: An
    # object containing the fields to POST for the request.  See the
    # corresponding object definition for field details.
    # @return [BatchRetrieveCatalogObjectsResponse Hash] response from the API call
    def batch_retrieve_catalog_objects(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/catalog/batch-retrieve'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Creates or updates up to 10,000 target objects based on the provided
    # list of objects. The target objects are grouped into batches and each
    # batch is
    # inserted/updated in an all-or-nothing manner. If an object within a batch
    # is
    # malformed in some way, or violates a database constraint, the entire batch
    # containing that item will be disregarded. However, other batches in the
    # same
    # request may still succeed. Each batch may contain up to 1,000 objects, and
    # batches will be processed in order as long as the total object count for
    # the
    # request (items, variations, modifier lists, discounts, and taxes) is no
    # more
    # than 10,000.
    # @param [BatchUpsertCatalogObjectsRequest] body Required parameter: An
    # object containing the fields to POST for the request.  See the
    # corresponding object definition for field details.
    # @return [BatchUpsertCatalogObjectsResponse Hash] response from the API call
    def batch_upsert_catalog_objects(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/catalog/batch-upsert'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Returns information about the Square Catalog API, such as batch size
    # limits for `BatchUpsertCatalogObjects`.
    # @return [CatalogInfoResponse Hash] response from the API call
    def catalog_info
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/catalog/info'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.get(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Returns a list of [CatalogObject](#type-catalogobject)s that includes
    # all objects of a set of desired types (for example, all
    # [CatalogItem](#type-catalogitem)
    # and [CatalogTax](#type-catalogtax) objects) in the catalog. The `types`
    # parameter
    # is specified as a comma-separated list of valid
    # [CatalogObject](#type-catalogobject) types:
    # `ITEM`, `ITEM_VARIATION`, `MODIFIER`, `MODIFIER_LIST`, `CATEGORY`,
    # `DISCOUNT`, `TAX`.
    # __Important:__ ListCatalog does not return deleted catalog items. To
    # retrieve
    # deleted catalog items, use SearchCatalogObjects and set
    # `include_deleted_objects`
    # to `true`.
    # @param [String] cursor Optional parameter: The pagination cursor returned
    # in the previous response. Leave unset for an initial request. See
    # [Pagination](https://developer.squareup.com/docs/basics/api101/pagination)
    # for more information.
    # @param [String] types Optional parameter: An optional case-insensitive,
    # comma-separated list of object types to retrieve, for example
    # `ITEM,ITEM_VARIATION,CATEGORY,IMAGE`.  The legal values are taken from the
    # [CatalogObjectType](#type-catalogobjecttype) enumeration, namely `ITEM`,
    # `ITEM_VARIATION`, `CATEGORY`, `DISCOUNT`, `TAX`, `MODIFIER`,
    # `MODIFIER_LIST`, or `IMAGE`.
    # @return [ListCatalogResponse Hash] response from the API call
    def list_catalog(cursor: nil,
                     types: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/catalog/list'
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'cursor' => cursor,
        'types' => types
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.get(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Creates or updates the target [CatalogObject](#type-catalogobject).
    # @param [UpsertCatalogObjectRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [UpsertCatalogObjectResponse Hash] response from the API call
    def upsert_catalog_object(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/catalog/object'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Deletes a single [CatalogObject](#type-catalogobject) based on the
    # provided ID and returns the set of successfully deleted IDs in the
    # response.
    # Deletion is a cascading event such that all children of the targeted
    # object
    # are also deleted. For example, deleting a [CatalogItem](#type-catalogitem)
    # will also delete all of its
    # [CatalogItemVariation](#type-catalogitemvariation) children.
    # @param [String] object_id Required parameter: The ID of the
    # [CatalogObject](#type-catalogobject) to be deleted. When an object is
    # deleted, other objects in the graph that depend on that object will be
    # deleted as well (for example, deleting a [CatalogItem](#type-catalogitem)
    # will delete its [CatalogItemVariation](#type-catalogitemvariation)s).
    # @return [DeleteCatalogObjectResponse Hash] response from the API call
    def delete_catalog_object(object_id:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/catalog/object/{object_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'object_id' => object_id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.delete(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Returns a single [CatalogItem](#type-catalogitem) as a
    # [CatalogObject](#type-catalogobject) based on the provided ID. The
    # returned
    # object includes all of the relevant [CatalogItem](#type-catalogitem)
    # information including: [CatalogItemVariation](#type-catalogitemvariation)
    # children, references to its
    # [CatalogModifierList](#type-catalogmodifierlist) objects, and the ids of
    # any [CatalogTax](#type-catalogtax) objects that apply to it.
    # @param [String] object_id Required parameter: The object ID of any type of
    # [CatalogObject](#type-catalogobject)s to be retrieved.
    # @param [Boolean] include_related_objects Optional parameter: If `true`,
    # the response will include additional objects that are related to the
    # requested object, as follows:  If the `object` field of the response
    # contains a [CatalogItem](#type-catalogitem), its associated
    # [CatalogCategory](#type-catalogcategory),
    # [CatalogTax](#type-catalogtax)es, [CatalogImage](#type-catalogimage)s and
    # [CatalogModifierList](#type-catalogmodifierlist)s will be returned in the
    # `related_objects` field of the response. If the `object` field of the
    # response contains a [CatalogItemVariation](#type-catalogitemvariation),
    # its parent [CatalogItem](#type-catalogitem) will be returned in the
    # `related_objects` field of  the response.  Default value: `false`
    # @return [RetrieveCatalogObjectResponse Hash] response from the API call
    def retrieve_catalog_object(object_id:,
                                include_related_objects: nil)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/catalog/object/{object_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'object_id' => object_id
      )
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        'include_related_objects' => include_related_objects
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.get(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Queries the targeted catalog using a variety of query types:
    # [CatalogQuerySortedAttribute](#type-catalogquerysortedattribute),
    # [CatalogQueryExact](#type-catalogqueryexact),
    # [CatalogQueryRange](#type-catalogqueryrange),
    # [CatalogQueryText](#type-catalogquerytext),
    # [CatalogQueryItemsForTax](#type-catalogqueryitemsfortax), and
    # [CatalogQueryItemsForModifierList](#type-catalogqueryitemsformodifierlist)
    # .
    # @param [SearchCatalogObjectsRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [SearchCatalogObjectsResponse Hash] response from the API call
    def search_catalog_objects(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/catalog/search'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Updates the [CatalogModifierList](#type-catalogmodifierlist) objects
    # that apply to the targeted [CatalogItem](#type-catalogitem) without having
    # to perform an upsert on the entire item.
    # @param [UpdateItemModifierListsRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [UpdateItemModifierListsResponse Hash] response from the API call
    def update_item_modifier_lists(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/catalog/update-item-modifier-lists'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end

    # Updates the [CatalogTax](#type-catalogtax) objects that apply to the
    # targeted [CatalogItem](#type-catalogitem) without having to perform an
    # upsert on the entire item.
    # @param [UpdateItemTaxesRequest] body Required parameter: An object
    # containing the fields to POST for the request.  See the corresponding
    # object definition for field details.
    # @return [UpdateItemTaxesResponse Hash] response from the API call
    def update_item_taxes(body:)
      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/catalog/update-item-taxes'
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.post(
        _query_url,
        headers: _headers,
        parameters: body.to_json
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(_response, data: decoded, errors: _errors)
    end
  end
end
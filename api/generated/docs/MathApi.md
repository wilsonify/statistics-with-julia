# MathApi

All URIs are relative to */v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**accuracy**](MathApi.md#accuracy) | **POST** /accuracy | 
[**bucketize**](MathApi.md#bucketize) | **POST** /bucketize | 
[**correlation**](MathApi.md#correlation) | **POST** /correlation | 
[**correlation_matrix**](MathApi.md#correlation_matrix) | **POST** /correlation_matrix | 
[**covariance**](MathApi.md#covariance) | **POST** /covariance | 
[**data_range**](MathApi.md#data_range) | **POST** /data_range | 
[**de_mean**](MathApi.md#de_mean) | **POST** /de_mean | 
[**difference_quotient**](MathApi.md#difference_quotient) | **POST** /difference_quotient | 
[**distance**](MathApi.md#distance) | **POST** /distance | 
[**dot**](MathApi.md#dot) | **POST** /dot | 
[**echo**](MathApi.md#echo) | **POST** /echo | 
[**estimate_gradient**](MathApi.md#estimate_gradient) | **POST** /estimate_gradient | 
[**f1_score**](MathApi.md#f1_score) | **POST** /f1_score | 
[**get_column**](MathApi.md#get_column) | **POST** /get_column | 
[**get_row**](MathApi.md#get_row) | **POST** /get_row | 
[**in_random_order**](MathApi.md#in_random_order) | **POST** /in_random_order | 
[**interquartile_range**](MathApi.md#interquartile_range) | **POST** /interquartile_range | 
[**magnitude**](MathApi.md#magnitude) | **POST** /magnitude | 
[**matrix_add**](MathApi.md#matrix_add) | **POST** /matrix_add | 
[**maximize_batch**](MathApi.md#maximize_batch) | **POST** /maximize_batch | 
[**maximize_stochastic**](MathApi.md#maximize_stochastic) | **POST** /maximize_stochastic | 
[**mean**](MathApi.md#mean) | **POST** /mean | 
[**median**](MathApi.md#median) | **POST** /median | 
[**minimize_batch**](MathApi.md#minimize_batch) | **POST** /minimize_batch | 
[**minimize_stochastic**](MathApi.md#minimize_stochastic) | **POST** /minimize_stochastic | 
[**mode**](MathApi.md#mode) | **POST** /mode | 
[**partial_difference_quotient**](MathApi.md#partial_difference_quotient) | **POST** /partial_difference_quotient | 
[**precision**](MathApi.md#precision) | **POST** /precision | 
[**quantile**](MathApi.md#quantile) | **POST** /quantile | 
[**recall**](MathApi.md#recall) | **POST** /recall | 
[**scalar_multiply**](MathApi.md#scalar_multiply) | **POST** /scalar_multiply | 
[**shape**](MathApi.md#shape) | **POST** /shape | 
[**split_data**](MathApi.md#split_data) | **POST** /split_data | 
[**sqrt**](MathApi.md#sqrt) | **POST** /sqrt | 
[**squared_distance**](MathApi.md#squared_distance) | **POST** /squared_distance | 
[**standard_deviation**](MathApi.md#standard_deviation) | **POST** /standard_deviation | 
[**strength**](MathApi.md#strength) | **POST** /strength | 
[**sum_of_squares**](MathApi.md#sum_of_squares) | **POST** /sum_of_squares | 
[**train_test_split**](MathApi.md#train_test_split) | **POST** /train_test_split | 
[**variance**](MathApi.md#variance) | **POST** /variance | 
[**vector_add**](MathApi.md#vector_add) | **POST** /vector_add | 
[**vector_mean**](MathApi.md#vector_mean) | **POST** /vector_mean | 
[**vector_subtract**](MathApi.md#vector_subtract) | **POST** /vector_subtract | 
[**vector_sum**](MathApi.md#vector_sum) | **POST** /vector_sum | 


# **accuracy**
> accuracy(req::HTTP.Request; accuracy_input=nothing,) -> Float64



Description of the endpoint

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **accuracy_input** | [**AccuracyInput**](AccuracyInput.md)|  | 

### Return type

**Float64**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **bucketize**
> bucketize(req::HTTP.Request; bucketize_input=nothing,) -> BucketizeOutput



Description of the endpoint

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **bucketize_input** | [**BucketizeInput**](BucketizeInput.md)|  | 

### Return type

[**BucketizeOutput**](BucketizeOutput.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **correlation**
> correlation(req::HTTP.Request; correlation_input=nothing,) -> CorrelationOutput



Description of the endpoint

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **correlation_input** | [**CorrelationInput**](CorrelationInput.md)|  | 

### Return type

[**CorrelationOutput**](CorrelationOutput.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **correlation_matrix**
> correlation_matrix(req::HTTP.Request; correlation_matrix_input=nothing,) -> CorrelationMatrixOutput



Description of the endpoint

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **correlation_matrix_input** | [**CorrelationMatrixInput**](CorrelationMatrixInput.md)|  | 

### Return type

[**CorrelationMatrixOutput**](CorrelationMatrixOutput.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **covariance**
> covariance(req::HTTP.Request; covariance_input=nothing,) -> CovarianceOutput



Description of the endpoint

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **covariance_input** | [**CovarianceInput**](CovarianceInput.md)|  | 

### Return type

[**CovarianceOutput**](CovarianceOutput.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **data_range**
> data_range(req::HTTP.Request; data_range_input=nothing,) -> DataRangeOutput



Description of the endpoint

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **data_range_input** | [**DataRangeInput**](DataRangeInput.md)|  | 

### Return type

[**DataRangeOutput**](DataRangeOutput.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **de_mean**
> de_mean(req::HTTP.Request; de_mean_input=nothing,) -> DeMeanOutput



Description of the endpoint

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **de_mean_input** | [**DeMeanInput**](DeMeanInput.md)|  | 

### Return type

[**DeMeanOutput**](DeMeanOutput.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **difference_quotient**
> difference_quotient(req::HTTP.Request; difference_quotient_input=nothing,) -> DifferenceQuotientOutput



Description of the endpoint

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **difference_quotient_input** | [**DifferenceQuotientInput**](DifferenceQuotientInput.md)|  | 

### Return type

[**DifferenceQuotientOutput**](DifferenceQuotientOutput.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **distance**
> distance(req::HTTP.Request; distance_input=nothing,) -> DistanceOutput



Description of the endpoint

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **distance_input** | [**DistanceInput**](DistanceInput.md)|  | 

### Return type

[**DistanceOutput**](DistanceOutput.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **dot**
> dot(req::HTTP.Request; dot_input=nothing,) -> DotOutput



Description of the endpoint

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dot_input** | [**DotInput**](DotInput.md)|  | 

### Return type

[**DotOutput**](DotOutput.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **echo**
> echo(req::HTTP.Request; body=nothing,) -> Any



Description of the endpoint

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | **Any**|  | 

### Return type

**Any**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **estimate_gradient**
> estimate_gradient(req::HTTP.Request; estimate_gradient_input=nothing,) -> EstimateGradientOutput



Description of the endpoint

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **estimate_gradient_input** | [**EstimateGradientInput**](EstimateGradientInput.md)|  | 

### Return type

[**EstimateGradientOutput**](EstimateGradientOutput.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **f1_score**
> f1_score(req::HTTP.Request; f1_score_input=nothing,) -> Float64



Description of the endpoint

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **f1_score_input** | [**F1ScoreInput**](F1ScoreInput.md)|  | 

### Return type

**Float64**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_column**
> get_column(req::HTTP.Request; get_column_input=nothing,) -> GetColumnOutput



Description of the endpoint

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **get_column_input** | [**GetColumnInput**](GetColumnInput.md)|  | 

### Return type

[**GetColumnOutput**](GetColumnOutput.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_row**
> get_row(req::HTTP.Request; get_row_input=nothing,) -> GetRowOutput



Description of the endpoint

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **get_row_input** | [**GetRowInput**](GetRowInput.md)|  | 

### Return type

[**GetRowOutput**](GetRowOutput.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **in_random_order**
> in_random_order(req::HTTP.Request; in_random_order_input=nothing,) -> Vector{Float64}



Description of the endpoint

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **in_random_order_input** | [**InRandomOrderInput**](InRandomOrderInput.md)|  | 

### Return type

**Vector{Float64}**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **interquartile_range**
> interquartile_range(req::HTTP.Request; interquartile_range_input=nothing,) -> Float64



Description of the endpoint

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **interquartile_range_input** | [**InterquartileRangeInput**](InterquartileRangeInput.md)|  | 

### Return type

**Float64**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **magnitude**
> magnitude(req::HTTP.Request; magnitude_input=nothing,) -> Float64



Description of the endpoint

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **magnitude_input** | [**MagnitudeInput**](MagnitudeInput.md)|  | 

### Return type

**Float64**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **matrix_add**
> matrix_add(req::HTTP.Request; matrix_add_input=nothing,) -> Vector{Vector{Float64}}



Description of the endpoint

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **matrix_add_input** | [**MatrixAddInput**](MatrixAddInput.md)|  | 

### Return type

**Vector{Vector{Float64}}**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **maximize_batch**
> maximize_batch(req::HTTP.Request; maximize_batch_input=nothing,) -> MaximizeBatchOutput



use gradient descent to find theta that minimizes target function

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **maximize_batch_input** | [**MaximizeBatchInput**](MaximizeBatchInput.md)|  | 

### Return type

[**MaximizeBatchOutput**](MaximizeBatchOutput.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **maximize_stochastic**
> maximize_stochastic(req::HTTP.Request; maximize_stochastic_input=nothing,) -> MaximizeStochasticOutput



Description of the endpoint

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **maximize_stochastic_input** | [**MaximizeStochasticInput**](MaximizeStochasticInput.md)|  | 

### Return type

[**MaximizeStochasticOutput**](MaximizeStochasticOutput.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **mean**
> mean(req::HTTP.Request; mean_input=nothing,) -> Float64



Description of the endpoint

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **mean_input** | [**MeanInput**](MeanInput.md)|  | 

### Return type

**Float64**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **median**
> median(req::HTTP.Request; median_input=nothing,) -> Float64



Description of the endpoint

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **median_input** | [**MedianInput**](MedianInput.md)|  | 

### Return type

**Float64**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **minimize_batch**
> minimize_batch(req::HTTP.Request; minimize_batch_input=nothing,) -> MinimizeBatchOutput



Description of the endpoint

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **minimize_batch_input** | [**MinimizeBatchInput**](MinimizeBatchInput.md)|  | 

### Return type

[**MinimizeBatchOutput**](MinimizeBatchOutput.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **minimize_stochastic**
> minimize_stochastic(req::HTTP.Request; minimize_stochastic_input=nothing,) -> MinimizeStochasticOutput



Description of the endpoint

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **minimize_stochastic_input** | [**MinimizeStochasticInput**](MinimizeStochasticInput.md)|  | 

### Return type

[**MinimizeStochasticOutput**](MinimizeStochasticOutput.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **mode**
> mode(req::HTTP.Request; mode_input=nothing,) -> Vector{Float64}



Description of the endpoint

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **mode_input** | [**ModeInput**](ModeInput.md)|  | 

### Return type

**Vector{Float64}**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **partial_difference_quotient**
> partial_difference_quotient(req::HTTP.Request; partial_difference_quotient_input=nothing,) -> PartialDifferenceQuotientOutput



add h to just the i-th element of v

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partial_difference_quotient_input** | [**PartialDifferenceQuotientInput**](PartialDifferenceQuotientInput.md)|  | 

### Return type

[**PartialDifferenceQuotientOutput**](PartialDifferenceQuotientOutput.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **precision**
> precision(req::HTTP.Request; precision_input=nothing,) -> Float64



Description of the endpoint

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **precision_input** | [**PrecisionInput**](PrecisionInput.md)|  | 

### Return type

**Float64**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **quantile**
> quantile(req::HTTP.Request; quantile_input=nothing,) -> Float64



Description of the endpoint

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **quantile_input** | [**QuantileInput**](QuantileInput.md)|  | 

### Return type

**Float64**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **recall**
> recall(req::HTTP.Request; recall_input=nothing,) -> Float64



Description of the endpoint

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **recall_input** | [**RecallInput**](RecallInput.md)|  | 

### Return type

**Float64**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **scalar_multiply**
> scalar_multiply(req::HTTP.Request; scalar_multiply_input=nothing,) -> Vector{Vector{Float64}}



Description of the endpoint

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **scalar_multiply_input** | [**ScalarMultiplyInput**](ScalarMultiplyInput.md)|  | 

### Return type

**Vector{Vector{Float64}}**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **shape**
> shape(req::HTTP.Request; shape_input=nothing,) -> ShapeOutput



Description of the endpoint

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **shape_input** | [**ShapeInput**](ShapeInput.md)|  | 

### Return type

[**ShapeOutput**](ShapeOutput.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **split_data**
> split_data(req::HTTP.Request; split_data_input=nothing,) -> SplitDataOutput



Description of the endpoint

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **split_data_input** | [**SplitDataInput**](SplitDataInput.md)|  | 

### Return type

[**SplitDataOutput**](SplitDataOutput.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **sqrt**
> sqrt(req::HTTP.Request; sqrt_input=nothing,) -> SqrtOutput



Description of the endpoint

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sqrt_input** | [**SqrtInput**](SqrtInput.md)|  | 

### Return type

[**SqrtOutput**](SqrtOutput.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **squared_distance**
> squared_distance(req::HTTP.Request; squared_distance_input=nothing,) -> Vector{Float64}



Description of the endpoint

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **squared_distance_input** | [**SquaredDistanceInput**](SquaredDistanceInput.md)|  | 

### Return type

**Vector{Float64}**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **standard_deviation**
> standard_deviation(req::HTTP.Request; standard_deviation_input=nothing,) -> Float64



Description of the endpoint

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **standard_deviation_input** | [**StandardDeviationInput**](StandardDeviationInput.md)|  | 

### Return type

**Float64**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **strength**
> strength(req::HTTP.Request; strength_input=nothing,) -> StrengthOutput



Description of the endpoint

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **strength_input** | [**StrengthInput**](StrengthInput.md)|  | 

### Return type

[**StrengthOutput**](StrengthOutput.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **sum_of_squares**
> sum_of_squares(req::HTTP.Request; sum_of_squares_input=nothing,) -> Float64



Description of the endpoint

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sum_of_squares_input** | [**SumOfSquaresInput**](SumOfSquaresInput.md)|  | 

### Return type

**Float64**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **train_test_split**
> train_test_split(req::HTTP.Request; train_test_split_input=nothing,) -> TrainTestSplitOutput



Description of the endpoint

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **train_test_split_input** | [**TrainTestSplitInput**](TrainTestSplitInput.md)|  | 

### Return type

[**TrainTestSplitOutput**](TrainTestSplitOutput.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **variance**
> variance(req::HTTP.Request; variance_input=nothing,) -> Float64



Description of the endpoint

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **variance_input** | [**VarianceInput**](VarianceInput.md)|  | 

### Return type

**Float64**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **vector_add**
> vector_add(req::HTTP.Request; vector_add_input=nothing,) -> Vector{Float64}



Description of the endpoint

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **vector_add_input** | [**VectorAddInput**](VectorAddInput.md)|  | 

### Return type

**Vector{Float64}**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **vector_mean**
> vector_mean(req::HTTP.Request; vector_mean_input=nothing,) -> Vector{Float64}



compute the vector whose i-th element is the mean of the i-th elements of the input vectors

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **vector_mean_input** | [**VectorMeanInput**](VectorMeanInput.md)|  | 

### Return type

**Vector{Float64}**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **vector_subtract**
> vector_subtract(req::HTTP.Request; vector_subtract_input=nothing,) -> Vector{Float64}



Description of the endpoint

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **vector_subtract_input** | [**VectorSubtractInput**](VectorSubtractInput.md)|  | 

### Return type

**Vector{Float64}**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **vector_sum**
> vector_sum(req::HTTP.Request; vector_sum_input=nothing,) -> Vector{Float64}



Description of the endpoint

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **vector_sum_input** | [**VectorSumInput**](VectorSumInput.md)|  | 

### Return type

**Vector{Float64}**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


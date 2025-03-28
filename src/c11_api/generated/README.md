# Julia API server for statistics-with-julia-api

This is a sample server Petstore server.  
You can find out more about Swagger at [http://swagger.io](http://swagger.io) or
on [irc.freenode.net, #swagger](http://swagger.io/irc/).

For this sample, you can use the api key `special-key` to test the authorization filters.

## Overview

This API server was generated by the [OpenAPI Generator](https://openapi-generator.tech) project.

By using the [openapi-spec](https://openapis.org) from a remote server,

you can easily generate an API client.

- API version: 1.0.0
- Build package: org.openapitools.codegen.languages.JuliaServerCodegen

## Installation

Place the Julia files generated under the `src` folder in your Julia project.

Include statistics-with-julia-api.jl in the project code.
It would include the module named statistics-with-julia-api.

Implement the server methods as listed below. They are also documented with the statistics-with-julia-api module.
Launch a HTTP server with a router that has all handlers registered.

A `register` method is provided in statistics-with-julia-api module for convenience.

```julia
register(
    router::HTTP.Router,        # Router to register handlers in
    impl;                       # Module that implements the server methods
    path_prefix::String="",     # Prefix to be applied to all paths
    optional_middlewares...     # Optional middlewares to be applied to all handlers
)
```

Optional middlewares can be one or more of:

- `init`: called before the request is processed
- `pre_validation`: called after the request is parsed but before validation
- `pre_invoke`: called after validation but before the handler is invoked
- `post_invoke`: called after the handler is invoked but before the response is sent

The order in which middlewares are invoked are:
`init |> read |> pre_validation |> validate |> pre_invoke |> invoke |> post_invoke`

## API Endpoints

The following server methods must be implemented:

| Class      | Method                                                                             | HTTP request                          | Description                                  |
|------------|------------------------------------------------------------------------------------|---------------------------------------|----------------------------------------------|
| *MathApi*  | [**accuracy**](docs/MathApi.md#accuracy)                                           | **POST** /accuracy                    |
| *MathApi*  | [**bucketize**](docs/MathApi.md#bucketize)                                         | **POST** /bucketize                   |
| *MathApi*  | [**correlation**](docs/MathApi.md#correlation)                                     | **POST** /correlation                 |
| *MathApi*  | [**correlation_matrix**](docs/MathApi.md#correlation_matrix)                       | **POST** /correlation_matrix          |
| *MathApi*  | [**covariance**](docs/MathApi.md#covariance)                                       | **POST** /covariance                  |
| *MathApi*  | [**data_range**](docs/MathApi.md#data_range)                                       | **POST** /data_range                  |
| *MathApi*  | [**de_mean**](docs/MathApi.md#de_mean)                                             | **POST** /de_mean                     |
| *MathApi*  | [**difference_quotient**](docs/MathApi.md#difference_quotient)                     | **POST** /difference_quotient         |
| *MathApi*  | [**distance**](docs/MathApi.md#distance)                                           | **POST** /distance                    |
| *MathApi*  | [**dot**](docs/MathApi.md#dot)                                                     | **POST** /dot                         |
| *MathApi*  | [**echo**](docs/MathApi.md#echo)                                                   | **POST** /echo                        |
| *MathApi*  | [**estimate_gradient**](docs/MathApi.md#estimate_gradient)                         | **POST** /estimate_gradient           |
| *MathApi*  | [**f1_score**](docs/MathApi.md#f1_score)                                           | **POST** /f1_score                    |
| *MathApi*  | [**get_column**](docs/MathApi.md#get_column)                                       | **POST** /get_column                  |
| *MathApi*  | [**get_row**](docs/MathApi.md#get_row)                                             | **POST** /get_row                     |
| *MathApi*  | [**in_random_order**](docs/MathApi.md#in_random_order)                             | **POST** /in_random_order             |
| *MathApi*  | [**interquartile_range**](docs/MathApi.md#interquartile_range)                     | **POST** /interquartile_range         |
| *MathApi*  | [**magnitude**](docs/MathApi.md#magnitude)                                         | **POST** /magnitude                   |
| *MathApi*  | [**matrix_add**](docs/MathApi.md#matrix_add)                                       | **POST** /matrix_add                  |
| *MathApi*  | [**maximize_batch**](docs/MathApi.md#maximize_batch)                               | **POST** /maximize_batch              |
| *MathApi*  | [**maximize_stochastic**](docs/MathApi.md#maximize_stochastic)                     | **POST** /maximize_stochastic         |
| *MathApi*  | [**mean**](docs/MathApi.md#mean)                                                   | **POST** /mean                        |
| *MathApi*  | [**median**](docs/MathApi.md#median)                                               | **POST** /median                      |
| *MathApi*  | [**minimize_batch**](docs/MathApi.md#minimize_batch)                               | **POST** /minimize_batch              |
| *MathApi*  | [**minimize_stochastic**](docs/MathApi.md#minimize_stochastic)                     | **POST** /minimize_stochastic         |
| *MathApi*  | [**mode**](docs/MathApi.md#mode)                                                   | **POST** /mode                        |
| *MathApi*  | [**partial_difference_quotient**](docs/MathApi.md#partial_difference_quotient)     | **POST** /partial_difference_quotient |
| *MathApi*  | [**precision**](docs/MathApi.md#precision)                                         | **POST** /precision                   |
| *MathApi*  | [**quantile**](docs/MathApi.md#quantile)                                           | **POST** /quantile                    |
| *MathApi*  | [**recall**](docs/MathApi.md#recall)                                               | **POST** /recall                      |
| *MathApi*  | [**scalar_multiply**](docs/MathApi.md#scalar_multiply)                             | **POST** /scalar_multiply             |
| *MathApi*  | [**shape**](docs/MathApi.md#shape)                                                 | **POST** /shape                       |
| *MathApi*  | [**split_data**](docs/MathApi.md#split_data)                                       | **POST** /split_data                  |
| *MathApi*  | [**sqrt**](docs/MathApi.md#sqrt)                                                   | **POST** /sqrt                        |
| *MathApi*  | [**squared_distance**](docs/MathApi.md#squared_distance)                           | **POST** /squared_distance            |
| *MathApi*  | [**standard_deviation**](docs/MathApi.md#standard_deviation)                       | **POST** /standard_deviation          |
| *MathApi*  | [**strength**](docs/MathApi.md#strength)                                           | **POST** /strength                    |
| *MathApi*  | [**sum_of_squares**](docs/MathApi.md#sum_of_squares)                               | **POST** /sum_of_squares              |
| *MathApi*  | [**train_test_split**](docs/MathApi.md#train_test_split)                           | **POST** /train_test_split            |
| *MathApi*  | [**variance**](docs/MathApi.md#variance)                                           | **POST** /variance                    |
| *MathApi*  | [**vector_add**](docs/MathApi.md#vector_add)                                       | **POST** /vector_add                  |
| *MathApi*  | [**vector_mean**](docs/MathApi.md#vector_mean)                                     | **POST** /vector_mean                 |
| *MathApi*  | [**vector_subtract**](docs/MathApi.md#vector_subtract)                             | **POST** /vector_subtract             |
| *MathApi*  | [**vector_sum**](docs/MathApi.md#vector_sum)                                       | **POST** /vector_sum                  |
| *PetApi*   | [**add_pet**](docs/PetApi.md#add_pet)                                              | **POST** /pet                         | Add a new pet to the store                   |
| *PetApi*   | [**delete_pet**](docs/PetApi.md#delete_pet)                                        | **DELETE** /pet/{petId}               | Deletes a pet                                |
| *PetApi*   | [**find_pets_by_status**](docs/PetApi.md#find_pets_by_status)                      | **GET** /pet/findByStatus             | Finds Pets by status                         |                   
| *PetApi*   | [**find_pets_by_tags**](docs/PetApi.md#find_pets_by_tags)                          | **GET** /pet/findByTags               | Finds Pets by tags                           |             
| *PetApi*   | [**get_pet_by_id**](docs/PetApi.md#get_pet_by_id)                                  | **GET** /pet/{petId}                  | Find pet by ID                               |   
| *PetApi*   | [**update_pet**](docs/PetApi.md#update_pet)                                        | **PUT** /pet                          | Update an existing pet                       |
| *PetApi*   | [**update_pet_with_form**](docs/PetApi.md#update_pet_with_form)                    | **POST** /pet/{petId}                 | Updates a pet in the store with form data    |
| *PetApi*   | [**upload_file**](docs/PetApi.md#upload_file)                                      | **POST** /pet/{petId}/uploadImage     | uploads an image                             |
| *StoreApi* | [**delete_order**](docs/StoreApi.md#delete_order)                                  | **DELETE** /store/order/{orderId}     | Delete purchase order by ID                  |   
| *StoreApi* | [**get_inventory**](docs/StoreApi.md#get_inventory)                                | **GET** /store/inventory              | Returns pet inventories by status            |    
| *StoreApi* | [**get_order_by_id**](docs/StoreApi.md#get_order_by_id)                            | **GET** /store/order/{orderId}        | Find purchase order by ID                    |       
| *StoreApi* | [**place_order**](docs/StoreApi.md#place_order)                                    | **POST** /store/order                 | Place an order for a pet                     |
| *UserApi*  | [**create_user**](docs/UserApi.md#create_user)                                     | **POST** /user                        | Create user                                  |
| *UserApi*  | [**create_users_with_array_input**](docs/UserApi.md#create_users_with_array_input) | **POST** /user/createWithArray        | Creates list of users with given input array |
| *UserApi*  | [**create_users_with_list_input**](docs/UserApi.md#create_users_with_list_input)   | **POST** /user/createWithList         | Creates list of users with given input array |
| *UserApi*  | [**delete_user**](docs/UserApi.md#delete_user)                                     | **DELETE** /user/{username}           | Delete user                                  |
| *UserApi*  | [**get_user_by_name**](docs/UserApi.md#get_user_by_name)                           | **GET** /user/{username}              | Get user by user name                        |         
| *UserApi*  | [**login_user**](docs/UserApi.md#login_user)                                       | **GET** /user/login                   | Logs user into the system                    |
| *UserApi*  | [**logout_user**](docs/UserApi.md#logout_user)                                     | **GET** /user/logout                  | Logs out current logged in user session      |
| *UserApi*  | [**update_user**](docs/UserApi.md#update_user)                                     | **PUT** /user/{username}              | Updated user                                 |

## Models

- [AccuracyInput](docs/AccuracyInput.md)
- [ApiResponse](docs/ApiResponse.md)
- [BucketizeInput](docs/BucketizeInput.md)
- [BucketizeOutput](docs/BucketizeOutput.md)
- [Category](docs/Category.md)
- [CorrelationInput](docs/CorrelationInput.md)
- [CorrelationMatrixInput](docs/CorrelationMatrixInput.md)
- [CorrelationMatrixOutput](docs/CorrelationMatrixOutput.md)
- [CorrelationOutput](docs/CorrelationOutput.md)
- [CovarianceInput](docs/CovarianceInput.md)
- [CovarianceOutput](docs/CovarianceOutput.md)
- [DataRangeInput](docs/DataRangeInput.md)
- [DataRangeOutput](docs/DataRangeOutput.md)
- [DeMeanInput](docs/DeMeanInput.md)
- [DeMeanOutput](docs/DeMeanOutput.md)
- [DifferenceQuotientInput](docs/DifferenceQuotientInput.md)
- [DifferenceQuotientOutput](docs/DifferenceQuotientOutput.md)
- [DistanceInput](docs/DistanceInput.md)
- [DistanceOutput](docs/DistanceOutput.md)
- [DotInput](docs/DotInput.md)
- [DotOutput](docs/DotOutput.md)
- [EstimateGradientInput](docs/EstimateGradientInput.md)
- [EstimateGradientOutput](docs/EstimateGradientOutput.md)
- [F1ScoreInput](docs/F1ScoreInput.md)
- [GetColumnInput](docs/GetColumnInput.md)
- [GetColumnOutput](docs/GetColumnOutput.md)
- [GetRowInput](docs/GetRowInput.md)
- [GetRowOutput](docs/GetRowOutput.md)
- [InRandomOrderInput](docs/InRandomOrderInput.md)
- [InterquartileRangeInput](docs/InterquartileRangeInput.md)
- [MagnitudeInput](docs/MagnitudeInput.md)
- [MatrixAddInput](docs/MatrixAddInput.md)
- [MaximizeBatchInput](docs/MaximizeBatchInput.md)
- [MaximizeBatchOutput](docs/MaximizeBatchOutput.md)
- [MaximizeStochasticInput](docs/MaximizeStochasticInput.md)
- [MaximizeStochasticOutput](docs/MaximizeStochasticOutput.md)
- [MeanInput](docs/MeanInput.md)
- [MedianInput](docs/MedianInput.md)
- [MinimizeBatchInput](docs/MinimizeBatchInput.md)
- [MinimizeBatchOutput](docs/MinimizeBatchOutput.md)
- [MinimizeStochasticInput](docs/MinimizeStochasticInput.md)
- [MinimizeStochasticOutput](docs/MinimizeStochasticOutput.md)
- [ModeInput](docs/ModeInput.md)
- [Order](docs/Order.md)
- [PartialDifferenceQuotientInput](docs/PartialDifferenceQuotientInput.md)
- [PartialDifferenceQuotientOutput](docs/PartialDifferenceQuotientOutput.md)
- [Pet](docs/Pet.md)
- [PrecisionInput](docs/PrecisionInput.md)
- [QuantileInput](docs/QuantileInput.md)
- [RecallInput](docs/RecallInput.md)
- [ScalarMultiplyInput](docs/ScalarMultiplyInput.md)
- [ShapeInput](docs/ShapeInput.md)
- [ShapeOutput](docs/ShapeOutput.md)
- [SplitDataInput](docs/SplitDataInput.md)
- [SplitDataOutput](docs/SplitDataOutput.md)
- [SqrtInput](docs/SqrtInput.md)
- [SqrtOutput](docs/SqrtOutput.md)
- [SquaredDistanceInput](docs/SquaredDistanceInput.md)
- [StandardDeviationInput](docs/StandardDeviationInput.md)
- [StrengthInput](docs/StrengthInput.md)
- [StrengthOutput](docs/StrengthOutput.md)
- [SumOfSquaresInput](docs/SumOfSquaresInput.md)
- [Tag](docs/Tag.md)
- [TrainTestSplitInput](docs/TrainTestSplitInput.md)
- [TrainTestSplitOutput](docs/TrainTestSplitOutput.md)
- [User](docs/User.md)
- [VarianceInput](docs/VarianceInput.md)
- [VectorAddInput](docs/VectorAddInput.md)
- [VectorMeanInput](docs/VectorMeanInput.md)
- [VectorSubtractInput](docs/VectorSubtractInput.md)
- [VectorSumInput](docs/VectorSumInput.md)

## Author

apiteam@swagger.io


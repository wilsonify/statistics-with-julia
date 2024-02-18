
using StatisticsWithJulia.c01_intro: grayscale_conversion
using StatisticsWithJulia.c01_intro: apply_box_blur
using StatisticsWithJulia.c01_intro: find_max_coordinates
using Test
using Images: load, Normed


# Define a test for the load function
@testset "Test load function" begin
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../../data")
    image_path = "$path_to_data/stars.png"
    img = load(image_path)
    @test typeof(img) == Array{RGBA{Normed{UInt8,8}},2}
end

# Define a test for the grayscale_conversion function
@testset "Test grayscale_conversion function" begin
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../../data")
    image_path = "$path_to_data/stars.png"
    img = load(image_path)
    gImg = grayscale_conversion(img)
    @test typeof(gImg) == Matrix{Float64}
end

# Define a test for the apply_box_blur function
@testset "Test apply_box_blur function" begin
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../../data")
    image_path = "$path_to_data/stars.png"
    img = load(image_path)
    gImg = grayscale_conversion(img)
    blur_radius = 5
    blurImg = apply_box_blur(gImg, blur_radius)
    @test typeof(blurImg) == Matrix{Float64}
end

# Define a test for the find_max_coordinates function
@testset "Test find_max_coordinates function" begin
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../../data")
    image_path = "$path_to_data/stars.png"
    img = load(image_path)
    gImg = grayscale_conversion(img)
    max_x, max_y = find_max_coordinates(gImg)
    @test typeof(max_x) == Int
    @test typeof(max_y) == Int
end

# Working with images
using Plots, Images, ImageMagick

function grayscale_conversion(image)
    gImg = red.(image) * 0.299 + green.(image) * 0.587 + blue.(image) * 0.114
    return gImg
end

function apply_box_blur(image, d)
    rows, cols = size(image)
    blurImg = [boxBlur(image, x, y, d, cols, rows) for x in 1:cols, y in 1:rows]
    return blurImg
end

function boxBlur(image, x, y, d, cols, rows)
    if x <= d || y <= d || x >= cols - d || y >= rows - d
        return image[x, y]
    else
        total = 0.0
        for xi = x - d:x + d
            for yi = y - d:y + d
                total += image[xi, yi]
            end
        end
        return total / ((2d + 1)^2)
    end
end

function find_max_coordinates(image)
    return argmax(image).I
end

function main_image_processing()
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../data")
    image_path = load("$path_to_data/stars.png")
    img = load(image_path)
    gImg = grayscale_conversion(img)
    blur_radius = 5
    blurImg = apply_box_blur(gImg, blur_radius)

    (xOriginal, yOriginal) = find_max_coordinates(gImg)
    (xBoxBlur, yBoxBlur) = find_max_coordinates(blurImg)

    p1 = heatmap(gImg, c = :Greys, yflip = true)
    p1 = scatter!((xOriginal, yOriginal), ms = 60, ma = 0, msw = 4, msc = :red)
    p2 = heatmap(blurImg, c = :Greys, yflip = true)
    p2 = scatter!((xBoxBlur, yBoxBlur), ms = 60, ma = 0, msw = 4, msc = :red)

    plot(p1, p2, size = (800, 400), ratio = :equal, xlims = (0, size(img, 2)), ylims = (0, size(img, 1)),
        colorbar_entry = false, border = :none, legend = :none)
end

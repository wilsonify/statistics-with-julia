using Random

function really_rand()
    return (rand(), rand(), rand())
end

function main_seed()
    Random.seed!(1974)
    println("Seed 1974: ", really_rand())
    Random.seed!(1975)
    println("Seed 1975: ", really_rand())
    Random.seed!(1974)
    println("Seed 1974: ", really_rand())
end

export really_rand


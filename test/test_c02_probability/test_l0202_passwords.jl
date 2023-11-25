# Password matching

function numMatch(loginPassword)
    correctPassword = "3xyZu4vN"
    passLength_c = length(correctPassword)
    passLength_l = length(loginPassword)
    passLength = min(passLength_c,passLength_l)
    return sum([loginPassword[i] == correctPassword[i] for i in 1:passLength])
    end

function gen_pw()
    passLength = 8
    possibleChars = ['a':'z' ; 'A':'Z' ; '0':'9']
    pw = rand(possibleChars,passLength)
    return String(pw)
end

function gen_many_pw(N)
    passwords = [gen_pw() for _ in 1:N]
    return passwords
    end

function main_password_matching()
    numMatchesForLog = 1
    passwords = gen_many_pw(10^7)
    numLogs = sum([numMatch(p) >= numMatchesForLog for p in passwords])
    println("Number of login attempts logged: ", numLogs)
    println("Proportion of login attempts logged: ", numLogs / N)
    end

using Test
using Random

@testset "Test gen_pw function" begin
    Random.seed!(0)
    result = gen_pw()
    @test length(result) == 8
end



@testset "Test numMatch function" begin
    Random.seed!(0)
    @test numMatch("3xyZu4vN") == 8
    @test numMatch("") == 0
    @test numMatch("abcdefg") == 0
end

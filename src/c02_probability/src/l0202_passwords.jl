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

if abspath(PROGRAM_FILE) == @__FILE__
    main_password_matching()
end

export gen_pw
export numMatch

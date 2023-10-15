--[[
    To use the function, use get_age(the month you are born, the day you are born, the year you are born)
]]

function get_age(bmonth, bday, byear)
    -- define the variables
    local lm = {1, 3, 5, 7, 8, 10, 12}
    local sm = {4, 6, 9, 11}
    local cyear = tonumber(os.date("%Y"))
    local cmonth = tonumber(os.date("%m"))
    local cday = tonumber(os.date("%d"))


    -- input the birthday
    byear = tonumber(byear)
    bmonth = tonumber(bmonth)
    bday = tonumber(bday)

    if (byear == nil and bmonth == nil and bday == nil)
    then return "your date is unreadable", "Your date is unreadable", "Your date is unreadable" end



    -- determin if the year is leap year
    function normal_leap(byear)
        year_test2 = byear / 4
        if year_test2 == math.floor(year_test2) then leapyear = true
        else leapyear = false end
    end

    function special_leap(byear)
        year_test2 = byear / 400
        if year_test2 == math.floor(year_test2) then leapyear = true
        else leapyear = false end
    end

    leapyear = false

    year_test = byear / 100
    if year_test == math.floor(year_test) then special_leap(byear)
    else normal_leap(byear) end

    print("Is birth-month leap year:", leapyear)


    -- determin if the month is flat or odd
    monthtype = -1

    if leapyear == true then legal_month_value = 29
    elseif leapyear == false then legal_month_value = 28
    end

    found = false
    for i, value in ipairs(lm) do
        if value == bmonth then
            found = true
            monthtype = 1
            legal_month_value = 31
            break
        end
    end
    if not found then
        for i, value in ipairs(sm) do
            if value == bmonth then
                found = true
                monthtype = 0
                legal_month_value = 30
                break
            end
        end
    end

    if monthtype == 1
    then print("The birth-month is a 31-day month.")
    elseif monthtype == 0
    then print("The birth-month is a 30-day month.")
    elseif (monthtype == -1 and leapyear == false)
    then print("The birth-month is a 28-day month.")
    elseif (monthtype == -1 and leapyear == true)
    then print("The birth-month is a 29-day month.")
    else print("Okay whaaaat????") end


    -- determin if month is valid or not
    if (byear >= 0 and bmonth > 0 and bday > 0 and bmonth <= 12 and bday <= legal_month_value)
    then print("Your date is valid.")
    else return "your date is invalid", "your date is invalid", "your date is invalid" end


    -- determin if the date is from the future or not
    if (byear > cyear)
    or (byear == cyear and bmonth > cmonth)
    or (byear == cyear and bmonth == cmonth and bday > cday)
    then return "you are not born yet", "you are not born yet", "you are not born yet"
    end


    -- calculate starts here


    -- calculate day
    dtest = cday - bday
    if (dtest < 0)
    then 
        RDAY = legal_month_value - bday + cday - 1
        cmonth = cmonth - 1
    else 
        RDAY = cday - bday
    end


    -- calculate month
    mtest = cmonth - bmonth
    if (mtest < 0)
    then
        RMONTH = 12 - bmonth + cmonth
        cyear = cyear - 1
    else
        RMONTH = cmonth - bmonth
    end


    -- calculate year
    RYEAR = cyear - byear


    -- print results
    return RYEAR, RMONTH, RDAY

end


io.write("Please input the year: ")
local byear_input = io.read()

io.write("Please input the month: ")
local bmonth_input = io.read()

io.write("Please input the day: ")
local bday_input = io.read()

local byear_result, bmonth_result, bday_result = get_age(bmonth_input, bday_input, byear_input)
print("\nToday, you are " .. 
    byear_result .. " year(s), " ..
    bmonth_result .. " month(s), and " ..
    bday_result .. " day(s) old.\n")

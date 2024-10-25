#!/usr/bin/awk

BEGIN {
    FS=","
    total_calls = 0
    
}

{
    total_calls++
}

{
    call_date = substr($2, 2, 10)
    call_time = substr($2, 14, 8)
    
    if (call_date in first_calls) {
        last_calls[call_date] = $0
    }
    else {
        first_calls[call_date] = $0
    }
}

{
    problem_type = $3
    if (problem_type in problem_counts) {
        problem_counts[problem_type]++
    }
    else {
        problem_counts[problem_type] = 1
    }
}

{
    division = $5
    if (division in division_counts) {
        division_counts[division]++
    }
    else {
        division_counts[division] = 1
    }
}


END {
    print "Total calls = " total_calls "\n"
    print "First call for each date:"
    for (date in first_calls) {
        print first_calls[date] "\n"
    }
    print "Last call for each date:"
    for (date in last_calls) {
        print last_calls[date] "\n"
    }
    print "Per-problem totals:"
    for (problem_type in problem_counts) {
        print problem_type ": " problem_counts[problem_type]
    }
    print "Per-division totals:"
    for (division in division_counts) {
        print division ": " division_counts[division]
    }
}

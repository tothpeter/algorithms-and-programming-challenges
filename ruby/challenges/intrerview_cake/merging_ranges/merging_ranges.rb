def exercise meetings
  sorted_meetings = meetings.sort
  result = [sorted_meetings[0]]

  i = 1
  j = 0

  while i < sorted_meetings.length
    if sorted_meetings[i][0] <= result[j][1]
      if sorted_meetings[i][1] > result[j][1]
        # Merge
        result[j][1] = sorted_meetings[i][1]
      end
    else
      # Push
      result << sorted_meetings[i]
      j += 1
    end

    i += 1
  end

  result
end
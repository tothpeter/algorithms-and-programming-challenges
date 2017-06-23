package interview_cake;

import java.util.ArrayList;
import java.util.Arrays;

public class P04MergingRanges {
	public static Meeting[] mergeRanges(Meeting[] meetings) {
		Meeting[] sortedMeetings = meetings.clone();
		Arrays.sort(sortedMeetings);
		
		ArrayList<Meeting> mergedList = new ArrayList<Meeting>();
		
		Meeting lastMergedMeeting = sortedMeetings[0];
		mergedList.add(lastMergedMeeting);

		for (Meeting currentMeeting : sortedMeetings) {
			
			if (currentMeeting.getStartTime() <= lastMergedMeeting.getEndTime()) {
				lastMergedMeeting.setEndTime(Math.max(lastMergedMeeting.getEndTime(), currentMeeting.getEndTime()));
			} else {
				mergedList.add(currentMeeting);
				lastMergedMeeting = currentMeeting;
			}
		}

		return mergedList.toArray(new Meeting[0]);
	}
}

package interview_cake;

public class Meeting implements Comparable<Meeting> {

    private int startTime;
    private int endTime;

    public Meeting(int startTime, int endTime) {
        // number of 30 min blocks past 9:00 am
        this.startTime = startTime;
        this.endTime   = endTime;
    }

    public int getStartTime() {
        return startTime;
    }

    public void setStartTime(int startTime) {
        this.startTime = startTime;
    }

    public int getEndTime() {
        return endTime;
    }

    public void setEndTime(int endTime) {
        this.endTime = endTime;
    }
    
    @Override
    public String toString() {
    	return String.format("(%s, %s)", this.startTime, this.endTime);
	}

	@Override
	public int compareTo(Meeting other) {
		return Integer.compare(this.startTime, other.startTime);
	}
}
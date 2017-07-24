package interview_cake;

public class Rectangle {

    // "zero" rectangle
    public static final Rectangle NO_RECTANGLE = new Rectangle();

    // coordinates of bottom left corner
    private int leftX;
    private int leftY;

    // dimensions
    private int width;
    private int height;

    public Rectangle() {}

    public Rectangle(int leftX, int leftY, int width, int height) {
        this.leftX = leftX;
        this.leftY = leftY;
        this.width  = width;
        this.height = height;
    }

    public int getLeftX() {
        return leftX;
    }

    public int getLeftY() {
        return leftY;
    }

    public int getWidth() {
        return width;
    }

    public int getHeight() {
        return height;
    }
    
    @Override
    public String toString() {
    	return String.format("(%s, %s, %s, %s)", this.leftX, this.leftY, this.width, this.height);
	}
}
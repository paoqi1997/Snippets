package patterns.singleton;

public class Singleton1 {
    private static Singleton1 instance = null;

    private Singleton1() {}

    public static Singleton1 getInstance() {
        if (instance == null) {
            instance = new Singleton1();
        }
        return instance;
    }

    public void intro() {
        System.out.format("I am %s.\n", Singleton1.class.getSimpleName());
    }
}

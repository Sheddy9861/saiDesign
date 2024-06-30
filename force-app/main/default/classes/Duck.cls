public abstract class Duck {
    FlyBehaviour flyBehaviour;
    QuackBehaviour quackBehaviour;
    public void Duck() {

    }
    public abstract void display();

    public void performFly(){
        flyBehaviour.fly();
    }
    public void performQuack(){
        quackBehaviour.quack();
    }

    public void swim(){
        System.debug('All Ducks float, even Decoys!!!');
    }
}
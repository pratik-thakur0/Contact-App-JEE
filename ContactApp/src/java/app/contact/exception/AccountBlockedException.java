package app.contact.exception;

/**
 * Use this class to report authentication failed problem due to invalid loginId and password.
 * @author pratik
 */
public class AccountBlockedException extends Exception{

    public AccountBlockedException() {
    }

    public AccountBlockedException(String errMsg) {
        super(errMsg);
    }
    
}

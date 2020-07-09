package com.kleinfelter.webapp.action;   
  
import org.appfuse.webapp.action.BaseAction;   
import com.kleinfelter.model.Address;   
import org.appfuse.service.GenericManager;   
  
import java.util.List;   
  
public class AddressAction extends BaseAction {   
    private GenericManager<Address, Long> addressManager;   
    private List addresses;
    private Address address;   
    private Long id;   
      
    public void setId(Long id) {   
        this.id = id;   
    }   
      
    public Address getAddress() {   
        return address;   
    }   
      
    public void setAddress(Address address) {   
        this.address = address;   
    }   
  
    public void setAddressManager(GenericManager<Address, Long> addressManager) {   
        this.addressManager = addressManager;   
    }   
  
    public List getAddresses() {   
        return addresses;   
    }   
  
    public String list() {   
        addresses = addressManager.getAll();   
        return SUCCESS;   
    }   
    public String delete() {   
        addressManager.remove(address.getId());   
        saveMessage(getText("address.deleted"));   
        return SUCCESS;   
    }   
  
    public String edit() {   
        if (id != null) {   
            address = addressManager.get(id);   
        } else {   
         address = new Address();   
        }   
        return SUCCESS;   
    }   
  
    public String save() throws Exception {   
        if (cancel != null) {   
            return "cancel";   
        }   
  
        if (delete != null) {   
            return delete();   
        }   
  
        boolean isNew = (address.getId() == null);   
  
        addressManager.save(address);   
  
        String key = (isNew) ? "address.added" : "address.updated";   
        saveMessage(getText(key));   
  
        if (!isNew) {   
            return INPUT;   
        } else {   
            return SUCCESS;   
        }   
    }  
}

import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Customer } from '../model/customer.model';

@Injectable({
  providedIn: 'root'
})
export class CustomerService {

  private apiUrl = "http://localhost:8089/api/customer/"

  constructor(
    private httpClient: HttpClient
  ) { }

  getAllCustomer():Observable<any>{
    return this.httpClient.get(this.apiUrl)
  }

  createCustomer(customer: Customer):Observable<any>{
    return this.httpClient.post(this.apiUrl, customer)
  }


  updateCustomer(id:number):Observable<any>{
    return this.httpClient.put(this.apiUrl+"/"+id, Customer)
  }

  deleteCustomer(id:number):Observable<any>{
    return this.httpClient.delete(this.apiUrl+"/"+id)
  }

  getById(id: number): Observable<any> {
    return this.httpClient.get(this.apiUrl + "/" + id);
  }
}

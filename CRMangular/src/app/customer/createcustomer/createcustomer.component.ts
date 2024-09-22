import { Component, OnInit } from '@angular/core';
import { Customer } from '../../model/customer.model';
import { CustomerService } from '../../service/customer.service';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { response } from 'express';

@Component({
  selector: 'app-createcustomer',
  templateUrl: './createcustomer.component.html',
  styleUrl: './createcustomer.component.css'
})
export class CreatecustomerComponent implements OnInit{

  customer: Customer = new Customer();
  formValue! = FormGroup;
  customerData = any;

  constructor(
    private customerService: CustomerService,
    private router: Router,
    private httpClient: HttpClient,
    private formBuilder: FormBuilder,
  ){}
  ngOnInit(): void {
    
    this.formValue = this.formBuilder.group({
      name: [''],
      email: ['', [Validators.required, Validators.email]],
      phone: ['', [Validators.required, Validators.pattern('^[0-9-+s()]*$')]],
      address: [''],
      status: ['Active'],
      createdAt: [new Date()],
      updatedAt: [new Date()]
    })

  }

  createCustomer(){
    this.customer.name = this.formValue.value.name;
    this.customer.email = this.formValue.value.email;
    this.customer.phone = this.formValue.value.phone;
    this.customer.address = this.formValue.value.address;
    this.customer.status = this.formValue.value.status;
    this.customer.createdAt = new Date();
    this.customer.updatedAt = new Date();
  }

  this.customerService.createCustomer(this.customer)
  .subscribe({
    next: response=>
      {
        console.log(response);
        this.formValue.reset();
        this.router.navigate(['/customer']);
      },
      error: error=>
        {
          console.log(error);
        }
  })

}

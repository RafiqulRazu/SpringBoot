import { NgModule } from '@angular/core';
import { BrowserModule, provideClientHydration } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { CreatecustomerComponent } from './customer/createcustomer/createcustomer.component';
import { ViewcustomerComponent } from './customer/viewcustomer/viewcustomer.component';

@NgModule({
  declarations: [
    AppComponent,
    CreatecustomerComponent,
    ViewcustomerComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [
    provideClientHydration()
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }

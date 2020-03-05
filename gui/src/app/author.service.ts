import { NgModule } from '@angular/core';
import { Injectable } from '@angular/core';
import { Http, Response } from '@angular/http';
import { Autores } from './autores';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';



@Injectable({
  providedIn: 'root'
})
export class AuthorService {

  url = 'http://localhost:3000/authors';


  constructor(private http: HttpClient) { }


  getAutores(): Observable<Object[]> {
    return this.http.get<Object[]>(this.url);
  }

  postAutores(value){
    this.http.post(this.url ,{
      name:value.autor
    });
  }

  // Error handling 
  handleError(error) {
    let errorMessage = '';
    if (error.error instanceof ErrorEvent) {
      // Get client-side error
      errorMessage = error.error.message;
    } else {
      // Get server-side error
      errorMessage = `Error Code: ${error.status}\nMessage: ${error.message}`;
    }
    window.alert(errorMessage);
    return throwError(errorMessage);
  }

}


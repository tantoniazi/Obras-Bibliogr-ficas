import { Component } from '@angular/core';
import { FormGroup } from '@angular/forms';
import { AuthorService } from './author.service';
import { Observable } from 'rxjs';
import { Autores } from './autores';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
  animations: [
    

  ]
})



export class AppComponent {
  all:any = [];
  form;
  autor;
  constructor(autor:AuthorService){
    this.autor = autor;
   
    
  }
  

  autorSubmit(value:any){

  }
  
  ngOnInit(){
     this.autor.getAutores().subscribe(data => {
       console.log(data);
      this.all = data;
    });
  }  

}

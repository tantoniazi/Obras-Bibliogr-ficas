import { Component } from '@angular/core';
import { FormGroup, FormBuilder } from '@angular/forms';
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
  public all:Observable<Object[]>;
  public form;


  constructor(
    private autor:AuthorService,
    private formBuilder: FormBuilder,){
   
    this.form = this.formBuilder.group({
      name: '',
    });

    
  }
  

  autorSubmit(value:any){
    this.autor.postAutores(value);
  }
  
  ngOnInit(){
    this.all  = this.autor.getAutores();
  }  

}

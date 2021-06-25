import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { map } from 'rxjs/operators';
import { HttpClient, HttpHeaders } from '@angular/common/http';
@Injectable({
  providedIn: 'root'
})
export class RequestsService {
  constructor(private http: HttpClient) {
  }

  getProducts(params) {
    let headers = new HttpHeaders();
    headers = headers.set('Access-Control-Allow-Origin','*')
    return this.http.get(environment.baseUrl + 'products',{params:params})
      .pipe(map((response:any) => {
        return response.data
      }));
  }
}
import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { RequestsService } from 'src/app/services/requests.service'

@Component({
  selector: 'app-estore',
  templateUrl: './estore.component.html',
  styleUrls: ['./estore.component.css']
})
export class EstoreComponent implements OnInit {
  categories: any;
  products: any;
  total: any;
  level = 0;
  catId: any;
  params = {};
  heading ='Categories'

  constructor(
    private http: HttpClient,
    private ES: RequestsService
  ) { }

  ngOnInit(): void {
    this.fetchData()
  }

  fetchData() {

    this.ES.getProducts(this.params).subscribe((data: any) => {
      console.log(data)
      this.categories = data.categories;
      this.products = data.products;
      this.total = data.total;
      this.heading=this.products[0].cat_name;
    }, (err) => {
      console.log(err)
    })
  }
  nextLevel() {
    if (this.level < 3)
      this.level += 1;
    this.setParams(this.level)
    this.fetchData()
  }
  previousLevel() {
    this.level -= 1;
    this.setParams(this.level)
    this.fetchData()
  }

  setParams(level) {
    let { catId, subIdLv1, subIdLv2 } = this.products[0]
    console.log(this.products[0])
    switch (level) {
      case 0: this.params = {}; break;
      case 1: this.params = { catId }; break;
      case 2: this.params = { subIdLv1 }; break;
      case 3: this.params = { subIdLv2 }; break;
    }
    console.log('id : ', this.catId)
    console.log('level : ', this.level)
    console.log('Params : ', this.params)
  }

}

import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { EstoreComponent } from './estore/estore.component';

const routes: Routes = [
  {
    path:'',
    redirectTo:'estore',pathMatch:'full'
  },
  {
    path: 'estore',
    component:EstoreComponent
}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

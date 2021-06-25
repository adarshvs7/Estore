
exports.seed = function(knex) {
  // Deletes ALL existing entries
  return knex('categories').del()
    .then(function () {
      // Inserts seed entries
      return knex('categories').insert([
        {id:1, cat_name: 'Mobiles, Computers', parentId: 0,level: 0},
        {id:2, cat_name: 'TV, Applications, Electronics', parentId: 0,level: 0},
        {id:3, cat_name: 'Mens Fashion', parentId: 0,level: 0},
        {id:4, cat_name: 'All Mobile Phones', parentId: 1,level: 1},
        {id:5, cat_name: 'All Mobile Accessories', parentId: 1,level: 1},
        {id:6, cat_name: 'Cases Covers', parentId: 1,level: 1},
        {id:7, cat_name: 'TV', parentId: 2,level: 1},
        {id:8, cat_name: 'Washing Machines', parentId: 2,level: 1},
        {id:9, cat_name: 'Refrigerators', parentId: 2,level: 1},
        {id:10, cat_name: 'Top Wear', parentId: 3,level: 1},
        {id:11, cat_name: 'Bottom Wear', parentId: 3,level: 1},
        {id:12, cat_name: 'Footwear', parentId: 3,level: 1},
        {id:13, cat_name: 'Smart Phones', parentId: 4,level: 2},
        {id:14, cat_name: 'Basic Phones', parentId: 4,level: 2},
        {id:15, cat_name: 'Android', parentId: 4,level: 2},
        {id:16, cat_name: 'Chargers', parentId: 5,level: 2},
        {id:17, cat_name: 'Headsets', parentId: 5,level: 2},
        {id:18, cat_name: 'Selfie Stick', parentId: 5,level: 2},
        {id:19, cat_name: 'Hard Cases', parentId: 6,level: 2},
        {id:20, cat_name: 'Polysilicon Cases', parentId: 6,level: 2},
        {id:21, cat_name: 'Shock Proof Cases', parentId: 6,level: 2},
        {id:22, cat_name: 'LCD TV', parentId: 7,level: 2},
        {id:23, cat_name: 'LED TV', parentId: 7,level: 2},
        {id:24, cat_name: 'Android TV', parentId: 7,level: 2},
        {id:25, cat_name: 'Manual', parentId: 8,level: 2},
        {id:26, cat_name: 'Semi Automatic', parentId: 8,level: 2},
        {id:27, cat_name: 'Fully Automatic', parentId: 8,level: 2},
        {id:28, cat_name: 'Single Door', parentId: 9,level: 2},
        {id:29, cat_name: 'Double Door', parentId: 9,level: 2},
        {id:30, cat_name: 'Convertable', parentId: 9,level: 2},
        {id:31, cat_name: 'Shirt', parentId: 10,level: 2},
        {id:32, cat_name: 'T-Shirt', parentId: 10,level: 2},
        {id:33, cat_name: 'Kurtas', parentId: 10,level: 2},
        {id:34, cat_name: 'Pants', parentId: 11,level: 2},
        {id:35, cat_name: 'Shorts', parentId: 11,level: 2},
        {id:36, cat_name: 'Casual Shoes', parentId: 12,level: 2},
        {id:37, cat_name: 'Formal Shoes', parentId: 12,level: 2},

      ]);
    });
};

/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     12/3/2017 5:27:53 PM                         */
/*==============================================================*/


drop table if exists Admins;

drop table if exists Buyer;

drop table if exists Comments;

drop table if exists FavouriteProduct;

drop table if exists FavouriteShop;

drop table if exists Orders;

drop table if exists Product;

drop table if exists ProductAD;

drop table if exists Seller;

drop table if exists SellerBlackList;

drop table if exists ShopAD;

/*==============================================================*/
/* Table: Admins                                                */
/*==============================================================*/
create table Admins
(
   adminId              int(11) not null auto_increment,
   adminAccount         varchar(256) not null,
   adminPassword        varchar(256) not null,
   adminName            varchar(256) not null,
   adminBalance         float not null default 0.0,
   adminPhone           varchar(45) not null,
   primary key (adminId)
);

/*==============================================================*/
/* Table: Buyer                                                 */
/*==============================================================*/
create table Buyer
(
   buyerId              int(11) not null auto_increment,
   buyerName            varchar(25) not null,
   buyerAddress         varchar(100) not null,
   buyerPhone           varchar(45)  not null,
   buyerPassword        varchar(20) not null,
   buyerStatus          int(11) not null,
   buyerBalance         float not null default 0.0,
   primary key (buyerId)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*==============================================================*/
/* Table: Comments                                              */
/*==============================================================*/
create table Comments
(
   commentId            int(11) not null auto_increment,
   productId            int(11),
   buyerId              int(11),
   content              varchar(512) not null,
   reply                varchar(512) not null,
   commentTime          datetime not null,
   primary key (commentId),
   key productId_idx ()
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*==============================================================*/
/* Table: FavouriteProduct                                      */
/*==============================================================*/
create table FavouriteProduct
(
   favorProductId       int(11) not null auto_increment,
   productId            int(11),
   buyerId              int(11),
   primary key (favorProductId)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*==============================================================*/
/* Table: FavouriteShop                                         */
/*==============================================================*/
create table FavouriteShop
(
   favouriteShopId      int(11) not null auto_increment,
   sellerId             int(11),
   buyerId              int(11),
   primary key (favouriteShopId)
);

/*==============================================================*/
/* Table: Orders                                                */
/*==============================================================*/
create table Orders
(
   orderId              int(11) not null auto_increment,
   sellerId             int(11),
   productId            int(11),
   buyerId              int(11),
   count                int(11) not null,
   totalPrice           float not null,
   address              varchar(45) not null,
   orderStatus          int(11) not null,
   orderTime            datetime not null,
   primary key (orderId),
   key productId_idx ()
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*==============================================================*/
/* Table: Product                                               */
/*==============================================================*/
create table Product
(
   productId            int(11) not null auto_increment,
   sellerId             int(11),
   productName          varchar(45) not null,
   productType          int(11) not null,
   productPrice         float not null,
   storeCount           int(11) not null,
   soldCount            int(11) not null,
   productIntroduction  varchar(512) not null,
   productPicture       varchar(512) not null,
   primary key (productId),
   key sellerId_idx ()
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*==============================================================*/
/* Table: ProductAD                                             */
/*==============================================================*/
create table ProductAD
(
   productADId          int(11) not null auto_increment,
   sellerId             int(11),
   adminId              int(11),
   productADName        varchar(256) not null,
   productADPhotoUrl    varchar(256) not null,
   productADClickUrl    varchar(256) not null,
   productADPrice       float not null,
   productADStartDate   datetime not null,
   productADEndDate     datetime not null,
   primary key (productADId)
);

/*==============================================================*/
/* Table: Seller                                                */
/*==============================================================*/
create table Seller
(
   sellerId             int(11) not null auto_increment,
   sellerName           varchar(45) not null,
   shopName             varchar(45) not null,
   sellerPassword       varchar(45) not null,
   sellerEmail          varchar(45) not null,
   sellerPhone          varchar(45) not null,
   sellerBalance        float not null default 0.0,
   shopIntroduction     varchar(512) not null,
   shopStatus           int(11) not null,
   primary key (sellerId)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*==============================================================*/
/* Table: SellerBlackList                                       */
/*==============================================================*/
create table SellerBlackList
(
   sellerBlackListId    int(11) not null auto_increment,
   sellerId             int(11),
   buyerId              int(11),
   primary key (sellerBlackListId)
);

/*==============================================================*/
/* Table: ShopAD                                                */
/*==============================================================*/
create table ShopAD
(
   shopADId             int(11) not null auto_increment,
   sellerId             int(11),
   adminId              int(11),
   shopADName           varchar(512) not null,
   shopADPhotoUrl       varchar(512) not null,
   shopADClickUrl       varchar(512) not null,
   shopADPrice          float not null,
   shopADStartDate      datetime not null,
   shopADEndDate        datetime not null,
   primary key (shopADId)
);

alter table Comments add constraint FK_Reference_18 foreign key (buyerId)
      references Buyer (buyerId) on delete restrict on update restrict;

alter table Comments add constraint FK_Reference_5 foreign key (productId)
      references Product (productId) on delete restrict on update restrict;

alter table FavouriteProduct add constraint FK_Reference_22 foreign key (buyerId)
      references Buyer (buyerId) on delete restrict on update restrict;

alter table FavouriteProduct add constraint FK_Reference_6 foreign key (productId)
      references Product (productId) on delete restrict on update restrict;

alter table FavouriteShop add constraint FK_Reference_21 foreign key (buyerId)
      references Buyer (buyerId) on delete restrict on update restrict;

alter table FavouriteShop add constraint FK_Reference_8 foreign key (sellerId)
      references Seller (sellerId) on delete restrict on update restrict;

alter table Orders add constraint FK_Reference_14 foreign key (buyerId)
      references Buyer (buyerId) on delete restrict on update restrict;

alter table Orders add constraint FK_Reference_15 foreign key (productId)
      references Product (productId) on delete restrict on update restrict;

alter table Orders add constraint FK_Reference_2 foreign key (sellerId)
      references Seller (sellerId) on delete restrict on update restrict;

alter table Product add constraint FK_Reference_3 foreign key (sellerId)
      references Seller (sellerId) on delete restrict on update restrict;

alter table ProductAD add constraint FK_Reference_12 foreign key (sellerId)
      references Seller (sellerId) on delete restrict on update restrict;

alter table ProductAD add constraint FK_Reference_16 foreign key (adminId)
      references Admins (adminId) on delete restrict on update restrict;

alter table SellerBlackList add constraint FK_Reference_10 foreign key (sellerId)
      references Seller (sellerId) on delete restrict on update restrict;

alter table SellerBlackList add constraint FK_Reference_17 foreign key (buyerId)
      references Buyer (buyerId) on delete restrict on update restrict;

alter table ShopAD add constraint FK_Reference_19 foreign key (sellerId)
      references Seller (sellerId) on delete restrict on update restrict;

alter table ShopAD add constraint FK_Reference_20 foreign key (adminId)
      references Admins (adminId) on delete restrict on update restrict;


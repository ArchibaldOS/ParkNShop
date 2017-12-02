/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     12/2/2017 9:00:40 PM                         */
/*==============================================================*/


drop table if exists AD;

/*==============================================================*/
/* Table: AD                                                    */
/*==============================================================*/
create table AD
(
   adId                 bigint not null,
   adName               char(256),
   adPhotoUrl           char(256),
   adClickUrl           char(256),
   adOwner              char(256),
   adPrice              float,
   adStartDate          date,
   adEndDate            date,
   primary key (adId)
);


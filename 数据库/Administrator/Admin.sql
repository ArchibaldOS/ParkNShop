/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     12/2/2017 9:01:28 PM                         */
/*==============================================================*/


drop table if exists Admin;

/*==============================================================*/
/* Table: Admin                                                 */
/*==============================================================*/
create table Admin
(
   adminId              int not null,
   adminAccount         char(256),
   adminPassword        char(256),
   adminName            char(256),
   adminBalance         float,
   adminPhone           bigint,
   primary key (adminId)
);


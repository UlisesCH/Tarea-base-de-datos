/*programa creado por: Ulises Edgardo Coreas Huezo
Carnet: CH18030

Fecha: 17/11/2018*/

//librerias obligatorias
#include <cstdlib>
#include <iostream>
#include <winsock2.h>
#include <mysql.h>
#include <mysqld_error.h>

//cuerpo del programa
using namespace std;

//Limpia la pantalla
void l(){
	system ("cls");
}

//Detiene el programa
void c(){
	system ("pause");
}

//variables utlizadas
void cliente();
void venta();
void producto();
void cotizacion();

	MYSQL *conn;
    MYSQL  mysql;
    MYSQL_RES *res;
    MYSQL_ROW row;

int main()
{
	// Intentar para conectar al servidor mysql
	mysql_init(&mysql);
	conn=mysql_real_connect(&mysql,"localhost","root","","systemventa",0,0,0);
	
//variable para regresar al menu
int opc;

do
{
	
//se le llama a la funcion para limmpiar pantalla
	l();

//Imprime en pantalla las opciones que se puede seleccionar
cout<<"\n1. Clientes";
cout<<"\t2. Productos";
cout<<"\t3. Ventas";
cout<<"\t0. SALIR";

//Imprime la peticion de la opcion a seleccionar
cout<<"\n Ingrese opcion: ";
//adquiere el valor
cin>>opc;

// Estructura para tomar entrar a la opcion seleccionada
switch(opc)
{
	//Entra a la opcion cliente
	case 1: cliente();
 	break;
 	 
 	//Entra a la opcion producto
 	case 2: producto();
 	break;
	
 	//Entra a la opcion venta
 	case 3: venta();
 	break;
 	
 	//Entra a la opcion de salida
 	case 0: exit(1);
	
	/*en el caso que seleccione una opcion que no se encuentre
	se activara el los sigueinres comandos*/
	
	default: 
	//se le llama a la funcion para limmpiar pantalla	
	l();
	
	//se imprime en la pantalla
	cout<<"Opcion no valida!!"<<endl; 
	cout<<"Intente con otra opcion"<<endl;
	
	//se le llama a la funcion para detener la pantalla
	c();
	break;
 	
}
	//Returna a la seleccion de las opcciones
}while(opc);

return 0;
}

//opcion cliente
void cliente()
{
	//se le llama a la funcion para limmpiar pantalla
	l();
	
	//Imprime para indicar de quien son los datos
	cout<<"Clientes"<<endl;
	
	//Imprime lo que tiene la tabla
	cout<<"Cod.cliente, Nombre,  Apellido,  TEl  "<<endl;
	cout<<endl;	
	
    //Inserta para optener los datos de la tabla
    mysql_query(conn,"SELECT * FROM `clientes` ");
    res=mysql_store_result(conn);
    
    //ciclo para imprimir los datos
    while((row=mysql_fetch_row(res))!=NULL)
    {
        cout<<row[0]<<"\t";
        cout<<row[1]<<"\t";
        cout<<row[2]<<"\t";
        cout<<row[3]<<endl;
    }
    //se le llama a la funcion para detener la pantalla
	c();
}

//opcion producto
void producto()
{
	//se le llama a la funcion para limmpiar pantalla
	l();
	
	//Imprime para indicar de quien son los datos
	cout<<"Productos"<<endl;
	
	//Imprime lo que tiene la tabla
	cout<<"Cod.pro, Nombre,  Precio, Existencias, fecha ingreso  "<<endl;
	cout<<endl;	
	
    //Inserta para optener los datos de la tabla
    mysql_query(conn,"SELECT * FROM `productos` ");
    res=mysql_store_result(conn);
    
    //ciclo para imprimir los datos
    while((row=mysql_fetch_row(res))!=NULL)
    {
        cout<<row[0]<<"\t";
        cout<<row[1]<<"\t";
        cout<<row[2]<<"\t";
        cout<<row[3]<<"\t";
        cout<<row[4]<<endl;
    }
   	//se le llama a la funcion para detener la pantalla
	c();
}

//opcion venta
void venta()
{
	//se le llama a la funcion para limmpiar pantalla
	l();
	
	//Imprime para indicar de quien son los datos
	cout<<"Ventas"<<endl;
	
	//Imprime lo que tiene la tabla
	cout<<"Cod.venta, Cod.producto, cantidad, fecha, cod.cliente  "<<endl;
	cout<<endl;	
	
    //Inserta para optener los datos de la tabla
    mysql_query(conn,"SELECT * FROM `ventas`");
    res=mysql_store_result(conn);
    
    //ciclo para imprimir los datos
    while((row=mysql_fetch_row(res))!=NULL)
    {
        cout<<row[0]<<"\t";
        cout<<row[1]<<"\t";
        cout<<row[2]<<"\t";
        cout<<row[3]<<"\t";
        cout<<row[4]<<endl;
    }
    //se le llama a la funcion para detener la pantalla
	c();
}


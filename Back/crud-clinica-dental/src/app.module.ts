import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AuthModule } from './Auth/auth.module';
import { User } from './Users/entities/user.entity';
import { UsersModule } from './Users/users.module';
import { ConfigModule } from '@nestjs/config';

@Module({
  imports: [AuthModule, 
    UsersModule, 
    TypeOrmModule.forRoot({
      type: 'mysql', // Tipo de base de datos
      host: 'localhost', // Cambia si usas otro host
      port: 3306, // Puerto MySQL (por defecto 3306)
      username: 'root', // Usuario MySQL
      password: 'Alaiayadei88', // Contraseña MySQL
      database: 'clinica_dental', // Nombre de tu base de datos
      entities: [User], // Dónde están tus entidades (modelos)
      synchronize: true, // ¡Ojo! En producción suele estar en false, para que no cambie el esquema automáticamente
    }),
    ConfigModule.forRoot({
      isGlobal: true, // lo hace accesible en todos los módulos sin volver a importarlo
    }),
  ],
  //controllers: [AppController],
  //providers: [AppService],
})
export class AppModule {}

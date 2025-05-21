import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { User } from './entities/user.entity';
import { Repository } from 'typeorm';
import { CreateUserDto } from './dto/create-user.dto';
//Para encryptar la contraseña en la base de datos
import * as bcrypt from 'bcrypt';


@Injectable()
export class UsersService {

  constructor(@InjectRepository(User) private readonly usersRepository: Repository<User>){}

  //Si quiero manejar errores tengo que hacerlo con un Async/Await
  async create(createUserDto: CreateUserDto): Promise <User> {
    const hashedPassword = await bcrypt.hash(createUserDto.password_users, 10);
    const user = this.usersRepository.create({
      ...createUserDto,
      password_users: hashedPassword,
    })
    //'This action adds a new users';
    return this.usersRepository.save(user);
  }

  findAll(): Promise<User[]> {
    //`This action returns all userss`;
    return this.usersRepository.find();
  }

  findOne(id_users: number): Promise<User> {
    //`This action returns a #id users`;
    return this.usersRepository.findOneBy({id_users: id_users});
  }

  async updatePassword(id_users: number, newPassword: string): Promise<string>{
    //`This action updates a password`;
    const user = await this.usersRepository.findOne({ where: { id_users: id_users } });
    if(!user){
      throw new Error(`Usuario con ID ${id_users} no encontrado`);
    }
    user.password_users = newPassword;
    await this.usersRepository.save(user);
    return `Contraseña actualizada para el usuario con ID ${id_users}`;
  }

  async remove(id_users: number): Promise<string> {
    const result = await this.usersRepository.delete(id_users);

    if (result.affected === 0) {
      throw new Error(`Usuario con ID ${id_users} no encontrado`);
    }

    return `Usuario con ID ${id_users} eliminado correctamente`;
  }

  async findByEmail(username_users: string): Promise<User | null> {
  return this.usersRepository.findOneBy({ username_users });
}

}

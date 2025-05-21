import { Injectable } from '@nestjs/common';
import * as bcrypt from 'bcrypt';
import { JwtService } from '@nestjs/jwt';
import { UsersService } from 'src/Users/users.service';
import { User } from 'src/Users/entities/user.entity';



@Injectable()
export class AuthService {

  constructor( private usersService: UsersService, private jwtService: JwtService){}

  async validateUser(username_users: string, password_users: string): Promise<any> {
    const user = await this.usersService.findByEmail(username_users);
    if (user && await bcrypt.compare(password_users, user.password_users)) {
      const { password_users, ...result } = user;
      return result;
    }
    return null;
  }

  async login(user: any) {
    const payload = { username: user.username_users, sub: user.id_users };
    return {
      access_token: this.jwtService.sign(payload),
    };
  }
  /*create(createAuthDto: CreateAuthDto) {
    return 'This action adds a new auth';
  }

  findAll() {
    return `This action returns all auths`;
  }

  findOne(id: number) {
    return `This action returns a #id auth`;
  }

  update(id: number, updateAuthDto: UpdateAuthDto) {
    return `This action updates a #id auth`;
  }

  remove(id: number) {
    return `This action removes a #id auth`;
  }*/
}

import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Patch,
  Post,
} from '@nestjs/common';
import { CreateAvailabilitiesDto } from './dto/create-availabilities.dto';
import { UpdateAvailabilitiesDto } from './dto/update-availabilities.dto';
import { AvailabilitiesService } from './availabilities.service';

@Controller('availabilitiess')
export class AvailabilitiesController {
  constructor(private readonly availabilitiesService: AvailabilitiesService) {}

  @Post()
  create(@Body() createAvailabilitiesDto: CreateAvailabilitiesDto) {
    return this.availabilitiesService.create(createAvailabilitiesDto);
  }

  @Get()
  findAll() {
    return this.availabilitiesService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.availabilitiesService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateAvailabilitiesDto: UpdateAvailabilitiesDto) {
    return this.availabilitiesService.update(+id, updateAvailabilitiesDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.availabilitiesService.remove(+id);
  }
}

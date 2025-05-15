import { TestBed } from '@angular/core/testing';

import { RESERVASService } from './reservas.service';

describe('RESERVASService', () => {
  let service: RESERVASService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(RESERVASService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});

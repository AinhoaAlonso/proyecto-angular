import { TestBed } from '@angular/core/testing';

import { ProfessionalAvailabilitiesTsService } from './professional-availabilities.ts.service';

describe('ProfessionalAvailabilitiesTsService', () => {
  let service: ProfessionalAvailabilitiesTsService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ProfessionalAvailabilitiesTsService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});

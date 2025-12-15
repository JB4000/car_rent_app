package com.pug.car_rent_app.controller;

import com.pug.car_rent_app.model.CarStatus;
import com.pug.car_rent_app.model.LeaseEndingToday;
import com.pug.car_rent_app.service.BusinessUserService;
import com.pug.car_rent_app.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class WorkshopController {

    @Autowired
    CarService carService;

    @Autowired
    BusinessUserService businessUserService;

    // I grabbed the / index page just for testing. It will of course be another mapping */
    @GetMapping("/workshop")
    public String workshop(Model model) {

        model.addAttribute("returnedCars", carService.getCarsReturned());

        // Hent alle leases der slutter i dag
        List<LeaseEndingToday> leasesEndingToday = businessUserService.getLeasesEndingToday();

        // Læg listen i modellen, så Thymeleaf kan loope over den
        model.addAttribute("leasesEndingToday", leasesEndingToday);

        return "workshop";
    }
    @GetMapping("/workshop/updateStatus")
    public String updateStatus(@RequestParam("carId") int carId,
                               @RequestParam("status") String status) {

        CarStatus carStatus = CarStatus.valueOf(status);
        carService.updateCarStatus(carId, carStatus);

        return "redirect:/workshop"; // back to the workshop page
    }
}

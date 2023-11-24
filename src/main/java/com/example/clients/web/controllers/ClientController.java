package com.example.clients.web.controllers;

import com.example.clients.domain.Client;
import com.example.clients.domain.ClientDto;
import com.example.clients.domain.Contact;
import com.example.clients.domain.ContactType;
import com.example.clients.repositories.ClientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class ClientController {
    private static final String CLIENT = "client";
    private final ClientRepository clientRepository;

    @Autowired
    public ClientController(ClientRepository clientRepository) {
        this.clientRepository = clientRepository;
    }

    @GetMapping("/")
    public String viewHomePage(Model model) {
        List<Client> clients = clientRepository.findAll();
        if (!clients.isEmpty()) {
            model.addAttribute("clients", clients);
        } else {
            clients = new ArrayList<>();
            model.addAttribute("clients", clients);
        }
        return "index";
    }

    @GetMapping("/client/{id}")
    public String viewClient(@PathVariable Integer id, @RequestParam(name = "t", required = false) String t, Model model) {
        Client client = clientRepository.findClientById(id);
        List<Contact> contacts = client.getContacts();
        if (client.getId() != 0) {
            model.addAttribute(CLIENT, client);
            if (t != null) {
                contacts = clientRepository.findContactByContactType(id, ContactType.valueOf(t));
            }
            model.addAttribute("contacts", contacts);
        } else {
            model.addAttribute("error", "Client with id " + id + " not found");
        }
        return CLIENT;
    }

    @GetMapping("/client/add")
    public String viewAdd() {
        return "client-add";
    }

    @PostMapping("/client/add")
    public String addAccount(@ModelAttribute ClientDto clientDto, BindingResult result,
                             @RequestParam Map<String, String> p, Model model) {
        String option = p.get("submit");
        if ("Cancel".equals(option)) {
            return "redirect:/";
        }
        if (!validateFields(clientDto)) {
            model.addAttribute("error", "Не заполнены обязательные поля");
            return "client-add";
        }
        Client client = clientDto.toNewClient(clientDto);
        if (result.hasErrors()) {
            model.addAllAttributes(p);
            model.addAttribute("error", result.getAllErrors().get(0).getDefaultMessage());
            return "client-add";
        }
        if ("Register".equals(option)) {
            Client dbClient = clientRepository.save(client);
            model.addAttribute(CLIENT, dbClient);
            return "redirect:/client/" + dbClient.getId();
        }
        return "redirect:/";
    }

    @GetMapping("/client/{id}/edit")
    public String viewClientEdit(@PathVariable Integer id, Model model) {
        Client client = clientRepository.findClientById(id);
        if (client != null) {
            model.addAttribute(CLIENT, client);
        } else {
            model.addAttribute("error", "Клиент с id " + id + " не найден");
        }
        return "client-edit";
    }

    @PostMapping("/client/{id}/edit")
    public String saveClient(@ModelAttribute("client") ClientDto clientDto, BindingResult result,
                             @RequestParam("submit") String option, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("error", result.getAllErrors().get(0).getDefaultMessage());
            return "client-edit";
        }
        Client client = clientRepository.findClientById(clientDto.getId());
        if (client != null) {
            if (option.equals("Save")) {
                Client dbClient = clientRepository.save(clientDto.toClient(client, clientDto));
                model.addAttribute(CLIENT, dbClient);
                return "redirect:/client/" + dbClient.getId();
            } else if (option.equals("Cancel")) {
                model.addAttribute(CLIENT, client);
                return "redirect:/client/" + client.getId();
            }
        }
        return "client-edit";
    }

    public boolean validateFields(ClientDto dto) {
        return !dto.getFirstName().isEmpty() && !dto.getLastName().isEmpty();
    }
}

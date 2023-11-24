package com.example.clients.repositories;

import com.example.clients.domain.Client;
import com.example.clients.domain.Contact;
import com.example.clients.domain.ContactType;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ClientRepository extends JpaRepository<Client, Integer> {
    @Override
    List<Client> findAll();

    @EntityGraph(attributePaths = {"contacts"})
    Client findClientById(@Param("id") Integer id);

    @Query(value = "SELECT c FROM Contact c WHERE c.client.id = :id AND c.contactType = :t")
    List<Contact> findContactByContactType(@Param("id") Integer id, @Param("t") ContactType t);
}

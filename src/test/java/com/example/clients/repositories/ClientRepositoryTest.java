package com.example.clients.repositories;

import com.example.clients.TestConfig;
import com.example.clients.domain.Client;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.datasource.init.ScriptUtils;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.transaction.annotation.Transactional;

import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.springframework.test.context.jdbc.Sql.ExecutionPhase.BEFORE_TEST_METHOD;

@ExtendWith(SpringExtension.class)
@SpringBootTest
@ContextConfiguration(classes = TestConfig.class)
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
@Sql(scripts = "/truncate_tables.sql", executionPhase = BEFORE_TEST_METHOD)
@Transactional
class ClientRepositoryTest {
    private static final String DELIMITER = "----------------------------------";
    @Autowired
    private ClientRepository clientRepo;
    @Autowired
    private DataSource dataSource;

    @BeforeAll
    void init() throws SQLException {
        System.out.println(DELIMITER);
        System.out.println("Test AccountDAO.beforeAll");
        ScriptUtils.executeSqlScript(dataSource.getConnection(), new ClassPathResource("create_tables.sql"));
    }

    Client getNewClient() {
        return new Client("Alina", "Zagitova");
    }

    Client getNewTargetClient() {
        return new Client("Kamila", "Valieva");
    }

    @Test
    void save() {
        System.out.println(DELIMITER);
        System.out.println("Test ClientRepository.save()");
        Client dbClient = clientRepo.save(getNewClient());
        assertNotNull(dbClient);
        System.out.println("Saved " + dbClient);
    }

    @Test
    void findClientById() {
        System.out.println(DELIMITER);
        System.out.println("Test ClientRepository.findAccountById()");
        Client dbClient = clientRepo.save(getNewClient());
        assertNotNull(dbClient);
        assertEquals(dbClient, clientRepo.findClientById(dbClient.getId()));
        System.out.println("Found " + dbClient);
    }

    @Test
    void findAll() {
        System.out.println(DELIMITER);
        System.out.println("Test ClientRepository.findAll()");
        Client dbClient = clientRepo.save(getNewClient());
        Client dbTargetClient = clientRepo.save(getNewTargetClient());
        assertNotNull(dbClient);
        assertNotNull(dbTargetClient);
        List<Client> clients = clientRepo.findAll();
        assertEquals(2, clients.size());
        System.out.println("Found all clients" + clients);
    }
}
package prothesis.finder.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import prothesis.finder.entities.Prothesis;

import java.util.List;
import java.util.Optional;

@Repository
public interface ProthesisRepository extends JpaRepository<Prothesis, Long> {

    Optional<Prothesis> findById(Long carId);

    List<Prothesis> findAll();
}

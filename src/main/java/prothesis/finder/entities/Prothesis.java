package prothesis.finder.entities;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@Entity
@Table(name = "prothesis")
public class Prothesis {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull
    private Sex sex;

    @NotNull
    private Double minAge;

    @NotNull
    private Double maxAge;

    @NotNull
    private Double minWeight;

    @NotNull
    private Double maxWeight;

    @NotNull
    private Activity activity;

    @NotNull
    private Double minBoneDensity;

    @NotNull
    private Double maxBoneDensity;

    @NotNull
    private ArthroplastyType arthroplastyType;

    @NotNull
    private ImplantType implantType;

    @NotNull
    private FixingType fixingType;

    @NotBlank
    private String model;
}

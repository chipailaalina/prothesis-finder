package prothesis.finder.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import prothesis.finder.entities.*;
import prothesis.finder.repositories.ProthesisRepository;

import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.function.Function;
import java.util.stream.Collectors;

@Controller
public class MainController {
    private static final String COMMA = ",";

    private ProthesisRepository prothesisRepository;

    @Autowired
    public MainController(final ProthesisRepository prothesisRepository) {
        this.prothesisRepository = prothesisRepository;
    }

    @RequestMapping(value = "/")
    public String loadProthesis(Model model) {
        System.out.println("loadProthesis");
        List<Prothesis> inputList = new ArrayList<>();
        try {
            InputStream inputFS = new ClassPathResource("prothesis.csv").getInputStream();
            BufferedReader br = new BufferedReader(new InputStreamReader(inputFS));
            inputList = br.lines().skip(1).map(mapToItem).collect(Collectors.toList());
            prothesisRepository.deleteAll();
            prothesisRepository.saveAll(inputList);
            br.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return getProthesis(model);
    }

    @RequestMapping(value = "/{[path:[^\\.]*}")
    public String getProthesis(Model model) {
        List<Prothesis> prothesisList = prothesisRepository.findAll();
        model.addAttribute("prothesis", prothesisList);
        return "main";
    }

    private Function<String, Prothesis> mapToItem = (line) -> {
        String[] p = line.split(COMMA);// a CSV has comma separated lines
        return Prothesis.builder()
                .sex(p[0])
                .minAge(Double.valueOf(p[1]))
                .maxAge(Double.valueOf(p[2]))
                .minWeight(Double.valueOf(p[3]))
                .maxWeight(Double.valueOf(p[4]))
                .activity(Activity.valueOf(p[5]))
                .boneDensity(BoneDensity.valueOf(p[6]))
                .arthroplastyType(ArthroplastyType.valueOf(p[7]))
                .implantType(ImplantType.valueOf(p[8]))
                .fixingType(p[9])
                .model(p[10])
                .build();
    };
}

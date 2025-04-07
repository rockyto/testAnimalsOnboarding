//
//  PaginacionViewController.swift
//  testAnimalsOnboarding
//
//  Created by Rodrigo Sánchez on 04/04/25.
//

import UIKit

class PaginacionViewController: UIPageViewController, UIPageViewControllerDataSource{
    
    var paginacion = [Pasos]()
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! ViewController).pasos.index
        index -= 1
        return paginacionController(index: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! ViewController).pasos.index
        index += 1
        return paginacionController(index: index)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let primerPaso = Pasos(index: 0, elAudioFile: "zebra", backIntro: UIImage(named: "zebra.jpg"))
        let segundoPaso = Pasos(index: 1, elAudioFile: "leon", backIntro: UIImage(named: "leon.jpg"))
        let tercerPaso = Pasos(index: 2, elAudioFile: "elefante", backIntro: UIImage(named: "elefante.jpg"))
        let cuartoPaso = Pasos(index: 3, elAudioFile: "dinosaurio1", backIntro: UIImage(named: "dinosaurio1.jpg"))
        let quintoPaso = Pasos(index: 4, elAudioFile: "dinosaurio2", backIntro: UIImage(named: "dinosaurio2.jpg"))
        let sextoPaso = Pasos(index: 5, elAudioFile: "dinosaurio3", backIntro: UIImage(named: "dinosaurio3.jpg"))
        
        paginacion.append(contentsOf: [primerPaso, segundoPaso, tercerPaso, cuartoPaso, quintoPaso, sextoPaso])
        
        dataSource = self
        
        if let inicioController = paginacionController(index: 0) {
            setViewControllers([inicioController], direction: .forward, animated: true, completion: nil)
        }
    }
    func paginacionController(index: Int)->ViewController?{
        if index < 0 || index >= paginacion.count {
            return nil
        }
        if let contenido = storyboard?.instantiateViewController(withIdentifier: "tutorialHijo") as? ViewController{
            
            contenido.pasos = paginacion[index]
            return contenido
        }
        return nil
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  ViewController.swift
//  AR Basketball
//
//  Created by Ivan Nikitin on 27/03/2019.
//  Copyright © 2019 Ivan Nikitin. All rights reserved.
//

import ARKit

class ViewController: UIViewController{

    @IBOutlet var sceneView: ARSCNView!
    
    var hoopAdded = false
    var score = 0
    var scoreNode: SCNNode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        //Set delegate for physicsWorld
        sceneView.scene.physicsWorld.contactDelegate = self
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        sceneView.debugOptions = [.showFeaturePoints]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .vertical
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
}

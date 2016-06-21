/**
 * Created by khs on 2016-05-03.
 */

var threejsCube = (function(){

    function cube(s) {

        var renderer = new THREE.WebGLRenderer({alpha: true}); //배경 투명하게
        renderer.setSize(350, 350);

        document.getElementById("grp").appendChild(renderer.domElement);

        var scene = new THREE.Scene();

        var camera = new THREE.PerspectiveCamera(40, canvas.width / canvas.height, 1, 1000);

        camera.position.set(-15, 10, 10);
        camera.lookAt(scene.position);

        //cube에 이미지텍스처를 입힌다.
        var texture = THREE.ImageUtils.loadTexture(s);
        var geometry = new THREE.BoxGeometry(8,8, 8);
        var material = new THREE.MeshBasicMaterial({map: texture});


        var mesh = new THREE.Mesh(geometry, material);
        scene.add(mesh);

        var light = new THREE.PointLight(0xFFFF00);
        light.position.set(10, 7, 10);
        scene.add(light);

        renderer.setClearColor(0x000000, 0);

        var loop = function () {
            //Mesh 객체를 회전 시킵니다.
            mesh.rotation.x += 0.02;
            mesh.rotation.y += 0.02;
            mesh.rotation.z += 0.02;

            //랜더링을 시작합니다.
            renderer.render(scene, camera);
            requestAnimationFrame(loop);
        };

        //루프를 시작합니다.
        requestAnimationFrame(loop);
    }

    function erase() {
        var cell = document.getElementById("grp");

        while ( cell.hasChildNodes() )
        {
            cell.removeChild( cell.firstChild );
        }

    }
    return {cube: cube, erase:erase}
})();

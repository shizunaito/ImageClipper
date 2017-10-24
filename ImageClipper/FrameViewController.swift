import UIKit

class FrameViewController: UIViewController {
    let maskImages = ["mask_cup","mask_heart","mask_movie","mask_t-shirt"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 
    }
}

// MARK: - UICollectionViewDelegate

extension FrameViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)

        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
        let cellImage = UIImage(named: maskImages[(indexPath as NSIndexPath).row])

        imageView.image = cellImage
        return cell
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return maskImages.count
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.popViewController(animated: true)
    }
}

extension FrameViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let cellSize:CGFloat = self.view.frame.size.width/2-4
        return CGSize(width: cellSize, height: cellSize)
    }
}


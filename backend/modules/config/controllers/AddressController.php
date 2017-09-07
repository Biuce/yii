<?php

namespace backend\modules\config\controllers;

use Yii;
use common\models\Address;
use yii\data\ActiveDataProvider;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * AddressController implements the CRUD actions for Address model.
 */
class AddressController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }


    public function actionIndex()
    {
        // include_once '../../vendor/phpoffice/phpword/samples/Sample_Header.php';

        require_once '../../vendor/phpoffice/phpword/bootstrap.php';

        // Creating the new document...
        $phpWord = new \PhpOffice\PhpWord\PhpWord();

        $phpWord->setDefaultFontName('Tahoma'); 
        $phpWord->setDefaultFontSize(12);
        /* Note: any element you append to a document must reside inside of a Section. */

        // Adding an empty Section to the document...
        $section = $phpWord->addSection();

        // Adding Text element to the Section having font styled by default...
        $section->addText(
            '"Learn from yesterday, live for today, hope for tomorrow. '
                . 'The important thing is not to stop questioning." '
                . '(Albert Einstein)'
        );

        /*
         * Note: it's possible to customize font style of the Text element you add in three ways:
         * - inline;
         * - using named font style (new font style object will be implicitly created);
         * - using explicitly created font style object.
         */

        // Adding Text element with font customized inline...
        $section->addText(
            '"Great achievement is usually born of great sacrifice, '
                . 'and is never the result of selfishness." '
                . '(Napoleon Hill)',
            array('name' => 'Tahoma', 'size' => 10)
        );

        // Adding Text element with font customized using named font style...
        $fontStyleName = 'oneUserDefinedStyle';
        $phpWord->addFontStyle(
            $fontStyleName,
            array('name' => 'Tahoma', 'size' => 10, 'color' => '1B2232', 'bold' => true)
        );
        $section->addText(
            '"The greatest accomplishment is not in never falling, '
                . 'but in rising again after you fall." '
                . '(Vince Lombardi)',
            $fontStyleName
        );
        $c = "地质灾害";
        $section->addText($c, 'rStyle', 'pStyle');
        $content="<p>根据市气象局未来24小时降雨预报和市水利局实时降雨数据，市国土资源局进行了地质灾害预报，
        请有关部门关注</p>
        <p>实时预警信息，做好地质灾害防范工作</p>";
        $section->addText($content);

        // Adding Text element with font customized using explicitly created font style object...
        $fontStyle = new \PhpOffice\PhpWord\Style\Font();
        $fontStyle->setBold(true);
        $fontStyle->setName('Tahoma');
        $fontStyle->setSize(13);
        $myTextElement = $section->addText('"Believe you can and you\'re halfway there." (Theodor Roosevelt)');
        $myTextElement->setFontStyle($fontStyle);

        $src = __DIR__.'/../../../web/images/admin-login-bg.jpg';

        $imageStyle = array('width'=>350, 'height'=>350, 'align'=>'center');
        $section->addImage( $src, [$imageStyle] );
        // Saving the document as OOXML file...
        $objWriter = \PhpOffice\PhpWord\IOFactory::createWriter($phpWord, 'Word2007');
        $objWriter->save('helloWorld.docx');
        var_dump($objWriter);die;
        // echo write($phpWord, basename(__FILE__, '.php'), $writers);
        // if (!CLI) {
        //     include_once '../../vendor/phpoffice/phpword/samples/Sample_Footer.php';
        // }
    }


    /**
     * Lists all Address models.
     * @return mixed
     */
    public function actionIndex1()
    {
        include_once '../../vendor/phpoffice/phpword/samples/Sample_Header.php';

        $phpWord = new \PhpOffice\PhpWord\PhpWord();
        $fontStyleName = 'rStyle';
        $phpWord->addFontStyle($fontStyleName, array('bold' => true, 'italic' => true, 'size' => 16, 'allCaps' => true, 'doubleStrikethrough' => true));
        $paragraphStyleName = 'pStyle';
        $phpWord->addParagraphStyle($paragraphStyleName, array('alignment' => \PhpOffice\PhpWord\SimpleType\Jc::CENTER, 'spaceAfter' => 100));
        $phpWord->addTitleStyle(1, array('bold' => true), array('spaceAfter' => 240));
        // New portrait section
        $section = $phpWord->addSection();
        // Simple text
        $section->addTitle('Welcome to PhpWord', 1);
        $section->addText('Hello World!');
        // Two text break
        $section->addTextBreak(2);
        // Define styles
        $section->addText('I am styled by a font style definition.', $fontStyleName);
        $section->addText('I am styled by a paragraph style definition.', null, $paragraphStyleName);
        $section->addText('I am styled by both font and paragraph style.', $fontStyleName, $paragraphStyleName);
        $section->addTextBreak();
        // Inline font style
        $fontStyle['name'] = 'Times New Roman';
        $fontStyle['size'] = 20;
        $textrun = $section->addTextRun();
        $textrun->addText('I am inline styled ', $fontStyle);
        $textrun->addText('with ');
        $textrun->addText('color', array('color' => '996699'));
        $textrun->addText(', ');
        $textrun->addText('bold', array('bold' => true));
        $textrun->addText(', ');
        $textrun->addText('italic', array('italic' => true));
        $textrun->addText(', ');
        $textrun->addText('underline', array('underline' => 'dash'));
        $textrun->addText(', ');
        $textrun->addText('strikethrough', array('strikethrough' => true));
        $textrun->addText(', ');
        $textrun->addText('doubleStrikethrough', array('doubleStrikethrough' => true));
        $textrun->addText(', ');
        $textrun->addText('superScript', array('superScript' => true));
        $textrun->addText(', ');
        $textrun->addText('subScript', array('subScript' => true));
        $textrun->addText(', ');
        $textrun->addText('smallCaps', array('smallCaps' => true));
        $textrun->addText(', ');
        $textrun->addText('allCaps', array('allCaps' => true));
        $textrun->addText(', ');
        $textrun->addText('fgColor', array('fgColor' => 'yellow'));
        $textrun->addText(', ');
        $textrun->addText('scale', array('scale' => 200));
        $textrun->addText(', ');
        $textrun->addText('spacing', array('spacing' => 120));
        $textrun->addText(', ');
        $textrun->addText('kerning', array('kerning' => 10));
        $textrun->addText('. ');
        // Link
        $section->addLink('https://github.com/PHPOffice/PHPWord', 'PHPWord on GitHub');
        $section->addTextBreak();

        // Save file
        echo write($phpWord, basename(__FILE__, '.php'), $writers);
        if (!CLI) {
            include_once '../../vendor/phpoffice/phpword/samples/Sample_Footer.php';
        }
    }

    /**
     * Displays a single Address model.
     * @param string $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Address model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Address();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->addressid]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Address model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param string $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->addressid]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Address model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param string $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Address model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param string $id
     * @return Address the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Address::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}

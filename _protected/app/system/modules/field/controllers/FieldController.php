<?php
/**
 * @author         Pierre-Henry Soria <ph7software@gmail.com>
 * @copyright      (c) 2013, Pierre-Henry Soria. All Rights Reserved.
 * @license        GNU General Public License; See PH7.LICENSE.txt and PH7.COPYRIGHT.txt in the root directory.
 * @package        PH7 / App / System / Module / Field / Controller
 */
namespace PH7;

use
PH7\Framework\Cache\Cache,
PH7\Framework\Mvc\Router\Uri,
PH7\Framework\Url\HeaderUrl;

class FieldController extends Controller
{

    private $sTitle;

    public function index()
    {
        HeaderUrl::redirect(Uri::get('field', 'field', 'all', 'user'));
    }

    public function all($sMod = '')
    {
        $this->sTitle = t('All Fields');
        $this->view->page_title = $this->sTitle;
        $this->view->h2_title = $this->sTitle;

        $oFieldModel = new FieldModel(Field::getTable($sMod));
        $this->view->fields = $oFieldModel->all();
        $this->view->mod = $sMod;

        $this->output();
    }

    public function add()
    {
        $this->sTitle = t('Add a Field');
        $this->view->page_title = $this->sTitle;
        $this->view->h2_title = $this->sTitle;

        $this->output();
    }

    public function edit($sMod = '', $sName = '')
    {
        if (Field::isExists($sMod, $sName))
        {
            $this->sTitle = t('Edit a Field');
            $this->view->page_title = $this->sTitle;
            $this->view->h2_title = $this->sTitle;

            $this->output();
        }
        else
        {
            $this->displayPageNotFound(t('Field "%0%" is not found!', $sName));
        }
    }

    public function delete()
    {
        $sMod = $this->httpRequest->post('mod');
        $sName = $this->httpRequest->post('name');

        if (Field::unmodifiable($sName) || !Field::isExists($sMod, $sName))
            $bStatus = false;
        else
        {
            $bStatus = (new FieldModel(Field::getTable($sMod), $sName))->delete();
            /* Clean UserCoreModel Cache */
            if ($bStatus) (new Cache)->start(UserCoreModel::CACHE_GROUP, null, null)->clear();
        }

        $sMsg = ($bStatus) ? t('The field has been deleted') : t('An error occurred while deleting the field.');
        $sMsgType = ($bStatus) ? 'success' : 'error';

        HeaderUrl::redirect(Uri::get('field', 'field', 'all', $sMod), $sMsg, $sMsgType);
    }

}

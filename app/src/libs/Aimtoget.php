<?php
/**
 *Description: ...
 *Created by: Isaac
 *Date: 1/28/2021
 *Time: 2:47 PM
 */

namespace Zikzay\libs;


use Aimtoget\Agent\Account;
use Aimtoget\Agent\Airtime;
use Aimtoget\Agent\Config;
use Aimtoget\Agent\Data;
use Aimtoget\Agent\Exceptions\ServiceException;
use Aimtoget\Agent\Networks;
use Aimtoget\Agent\Services;

class Aimtoget
{
    private $account;
    private $airtime;
    private $data;
    private $networks;
    private $services;

    public function __construct()
    {
        $config = new Config(Hash::decrypt(AIMTOGET_PRIVATE_KEY), Hash::decrypt(AIMTOGET_WALLET_PIN));
        $this->account = new Account($config);
        $this->airtime = new Airtime($config);
        $this->data = new Data($config);
        $this->networks = new Networks($config);
        $this->services = new Services($config);
    }

    public function balance() {
        return $this->account->getBalance();
    }

    public function purchaseAirtime($network, $phoneNumber, $amount) {
        try {
            $result = $this->airtime->purchase([
                'phone' => '09061668519',
                'network_id' => 1,
                'amount' => 100
            ]);
            return is_object($result) ? $result->ref : null;
        } catch (ServiceException $e) {
            return null;
        }

    }

    public function allMobileNetworks() {
        return $this->networks->getAllNetworks();
    }

    public function allDataPlans() {
        return $this->data->getAllVariations();
    }

    public function dataPlans($networkId = null) {
        return $networkId == null
            ? $this->data->getAllVariations()
            : $this->data->getNetworkVariations($networkId);
    }

    public function purchaseData($networkId, $dataPlan, $phoneNumber) {
        $reference = $this->data->purchase([
            'phone' => $networkId,
            'network_id' => $phoneNumber,
            'variation' => $dataPlan
        ]);
    }

    public function allBillServices() {
        return $this->services->getAll();
    }

    public function billService($serviceId) {
        return $this->services->getService($serviceId);
    }

    public function verifyCustomer($serviceId, $customerId) {
        $verify = $this->services->verifyCustomer($serviceId, $customerId);
    }
    
    public function payBills($serviceId, $customerId, $amount, $serviceVariant, $customerPhone, $customerEmail) {
        $reference = $this->services->pay($serviceId, [
            'customer_id' => $customerId,
            'amount' => $amount, //For services WITHOUT variations,
            'variation' => $serviceVariant, //For services WITH variations,
            'phone' => $customerPhone,
            'email' => $customerEmail
        ]);
    }



}